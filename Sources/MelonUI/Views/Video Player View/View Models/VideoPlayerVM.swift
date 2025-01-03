//
//  VideoPlayerVM.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - VideoPlayerVM

@MainActor
@available(iOS 17.0, *)
final class VideoPlayerVM: VideoPlayerViewModellable {
    private let urlRequest: URLRequest
    private let cacheDirectoryPath: URL = {
        let fileManager = FileManager.default

        return fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }()
    private let fileManager = FileManager.default
    @Published private(set) var state: VideoPlayerVM.State = .loading

    init(request urlRequest: URLRequest) {
        self.urlRequest = urlRequest
    }

    func load(_ completion: (_ fileURL: URL) -> Void) async {
        // Getting file URL
        guard let url = urlRequest.url else {
            await MainActor.run { state = .error }

            return
        }

        let fileName = url.lastPathComponent
        let fileURL = cacheDirectoryPath.appendingPathComponent(fileName)
        let filePath = fileURL.path()

        if !fileManager.fileExists(atPath: filePath) {
            // Loading video data
            guard
                let (data, response) = try? await URLSession.shared.data(for: urlRequest),
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                await MainActor.run { state = .error }

                return
            }

            // Caching video data
            guard let _ = try? data.write(to: fileURL, options: .atomic) else {
                await MainActor.run { state = .error }

                return
            }
        }

        await MainActor.run {
            completion(fileURL)

            state = .loaded
        }
    }

    func reload(_ completion: (_ fileURL: URL) -> Void) async {
        await MainActor.run { state = .loading }

        await load(completion)
    }
}
