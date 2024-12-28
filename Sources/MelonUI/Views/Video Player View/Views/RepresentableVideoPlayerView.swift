//
//  RepresentableVideoPlayerView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import SwiftUI



// MARK: - RepresentableVideoPlayerView

@available(iOS 16.0, *)
final class RepresentableVideoPlayerView: UIView {
    private let playerLayer = AVPlayerLayer()

    convenience init(
        player: AVQueuePlayer,
        gravity videoGravity: AVLayerVideoGravity
    ) {
        self.init(frame: .zero)

        playerLayer.player = player
        playerLayer.videoGravity = videoGravity
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSublayers()
    }

    required init?(coder: NSCoder) {
        fatalError("\(Self.self) doesn't support XIB layout.")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        playerLayer.frame = bounds
    }

    private func setupSublayers() {
        layer.addSublayer(playerLayer)
    }
}
