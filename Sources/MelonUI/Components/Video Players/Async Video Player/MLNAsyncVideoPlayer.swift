//
//  MLNAsyncVideoPlayer.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 17.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNAsyncVideoPlayer

///
///
///
@available(iOS 17.0, *)
public struct MLNAsyncVideoPlayer<Loader: View, Error: View>: View {

    // MARK: - Private properties

    private let player: MLNVideoPlayer
    private let loader: Loader
    private let error: (_ action: @escaping () -> Void) -> Error
    private let completion: (() -> Void)?

    @State private var viewModel: AsyncVideoPlayerViewModel

    @Environment(\.asyncVideoPlayerStyle) private var asyncVideoPlayerStyle



    // MARK: - Body

    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                loader
                    .transition(asyncVideoPlayerStyle.transition ?? .identity)
            case .error:
                error(reload)
                    .transition(asyncVideoPlayerStyle.transition ?? .identity)
            case .loaded(let fileURL):
                let _ = player.setupPlayer(with: fileURL)

                AsyncVideoPlayerView(player: player.queue, gravity: asyncVideoPlayerStyle.videoGravity)
                    .transition(asyncVideoPlayerStyle.transition ?? .identity)
                    .onAppear(perform: completion)
            }
        }
        .task(priority: .background) {
            await viewModel.load()
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        player: MLNVideoPlayer,
        @ViewBuilder loader: () -> Loader = { Color.clear },
        @ViewBuilder error: @escaping (_ action: @escaping () -> Void) -> Error = { _ in EmptyView() },
        completion: (() -> Void)? = nil
    ) {
        self.player = player
        self.loader = loader()
        self.error = error
        self.completion = completion
        self.viewModel = .init(request: player.request)
    }



    // MARK: - Private functions

    private func reload() {
        Task(priority: .background) {
            await viewModel.reload()
        }
    }
}
