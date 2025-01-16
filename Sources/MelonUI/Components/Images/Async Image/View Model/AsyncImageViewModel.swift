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



// MARK: - AsyncImageViewModellable

@available(iOS 17.0, *)
@MainActor protocol AsyncImageViewModellable: Observable {
    var state: AsyncImageState { get }

    func load() async
    func reload() async
}



// MARK: - AsyncImageViewModel

@available(iOS 17.0, *)
@Observable final class AsyncImageViewModel: AsyncImageViewModellable {
    private(set) var state: AsyncImageState = .loading
    private let request: URLRequest

    init(request: URLRequest) {
        self.request = request
    }

    func load() async {
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

    func reload() async {
        await MainActor.run { state = .loading }

        await load()
    }
}
