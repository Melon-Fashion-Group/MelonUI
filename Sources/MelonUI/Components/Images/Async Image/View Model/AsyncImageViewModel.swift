//
//  AsyncImageViewModel.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 16.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Observation
import UIKit



// MARK: - AsyncImageState

@available(iOS 17.0, *)
@MainActor enum AsyncImageState {
    case loading
    case error
    case loaded(image: UIImage)
}



// MARK: - AsyncImageViewModellable

@available(iOS 17.0, *)
@MainActor protocol AsyncImageViewModellable: Observable {
    var state: AsyncImageState { get }

    func load(with request: URLRequest) async
    func reload(with request: URLRequest) async
}



// MARK: - AsyncImageViewModel

@available(iOS 17.0, *)
@Observable final class AsyncImageViewModel: AsyncImageViewModellable {
    private(set) var state: AsyncImageState = .loading

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
            // Loading image data from web
            guard
                let (data, response) = try? await URLSession.shared.data(for: request),
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                await MainActor.run { state = .error }; return
            }

            // Caching image data
            guard let _ = try? data.write(to: fileURL, options: .atomic) else {
                await MainActor.run { state = .error }; return
            }
        }

        // Loading image data from cache
        guard let image = UIImage(contentsOfFile: filePath) else {
            await MainActor.run { state = .error }; return
        }

        await MainActor.run { state = .loaded(image: image) }
    }

    func reload(with request: URLRequest) async {
        await MainActor.run { state = .loading }

        await load(with: request)
    }
}
