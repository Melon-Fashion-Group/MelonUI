//
//  AsyncVideoPlayerViewModel.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 17.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation
import MelonKit



// MARK: - AsyncVideoPlayerState

@available(iOS 17.0, *)
@MainActor enum AsyncVideoPlayerState {
    case loading
    case error
    case loaded(fileURL: URL)
}



// MARK: - AsyncVideoPlayerViewModellable

@available(iOS 17.0, *)
@MainActor protocol AsyncVideoPlayerViewModellable: Observable {
    var state: AsyncVideoPlayerState { get }

    func load(with request: URLRequest) async
    func reload(with request: URLRequest) async
}



// MARK: - AsyncVideoPlayerViewModel

@available(iOS 17.0, *)
@Observable final class AsyncVideoPlayerViewModel: AsyncVideoPlayerViewModellable {
    private(set) var state: AsyncVideoPlayerState = .loading

    func load(with request: URLRequest) async {
        // Getting file path
        guard
            let cachesDirectoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first,
            let fileName = request.url?.lastPathComponent
        else {
            await MainActor.run { state = .error }; return
        }

        let fileURL = cachesDirectoryURL.appendingPathComponent(fileName)
        let filePath = fileURL.path()

        if !FileManager.default.fileExists(atPath: filePath) {
            // Loading video data from web
            guard
                let (data, response) = try? await URLSession.shared.data(for: request),
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                await MainActor.run { state = .error }; return
            }

            // Caching video data
            guard let _ = try? data.write(to: fileURL, options: .atomic) else {
                await MainActor.run { state = .error }; return
            }
        }

        await MainActor.run { state = .loaded(fileURL: fileURL) }
    }

    func reload(with request: URLRequest) async {
        await MainActor.run { state = .loading }

        await load(with: request)
    }
}
