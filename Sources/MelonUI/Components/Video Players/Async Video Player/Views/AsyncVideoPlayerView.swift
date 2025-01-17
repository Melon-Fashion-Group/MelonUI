//
//  AsyncVideoPlayerView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 17.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import SwiftUI



// MARK: - AsyncVideoPlayerView

@available(iOS 17.0, *)
struct AsyncVideoPlayerView: UIViewRepresentable {
    private let player: AVQueuePlayer
    private let videoGravity: AVLayerVideoGravity

    init(
        player: AVQueuePlayer,
        gravity videoGravity: AVLayerVideoGravity
    ) {
        self.player = player
        self.videoGravity = videoGravity
    }

    func makeUIView(context: Context) -> RepresentableAsyncVideoPlayerView {
        .init(player: player, gravity: videoGravity)
    }

    func updateUIView(_ uiView: RepresentableAsyncVideoPlayerView, context: Context) { }
}
