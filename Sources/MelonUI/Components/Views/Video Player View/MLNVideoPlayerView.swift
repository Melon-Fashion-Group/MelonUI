//
//  MLNVideoPlayerView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNVideoPlayerView

///
///
///
@available(iOS 17.0, *)
public struct MLNVideoPlayerView<Loader: View, Error: View>: View {

    // MARK: - Private properties

    @StateObject private var viewModel: VideoPlayerVM

    private let player: MLNVideoPlayer

    private let loader: Loader
    private let error: (_ action: @escaping () -> Void) -> Error

    @Environment(\.videoGravity) private var videoGravity



    // MARK: - Body

    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading: loader
            case .error: error(reload)
            case .loaded: VideoPlayerView(player: player.queue, gravity: videoGravity)
            }
        }
        .task(priority: .background) {
            await viewModel.load { fileURL in
                player.setupPlayer(with: fileURL)
            }
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        player: MLNVideoPlayer,
        @ViewBuilder loader: () -> Loader,
        @ViewBuilder error: @escaping (_ action: @escaping () -> Void) -> Error = { _ in EmptyView() }
    ) {
        _viewModel = .init(wrappedValue: .init(request: player.urlRequest))

        self.player = player

        self.loader = loader()
        self.error = error
    }



    // MARK: - Private functions

    private func reload() {
        Task(priority: .background) {
            await viewModel.reload { fileURL in
                player.setupPlayer(with: fileURL)
            }
        }
    }
}
