//
//  RepresentableAsyncVideoPlayerView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 17.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import SwiftUI



// MARK: - RepresentableAsyncVideoPlayerView

@available(iOS 17.0, *)
final class RepresentableAsyncVideoPlayerView: UIView {
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

        setupRootView()
        setupRootLayer()

        setupSublayers()

        computeFrames()
    }

    required init?(coder: NSCoder) {
        fatalError("\(Self.self) doesn't support XIB layout.")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        computeFrames()
    }

    private func setupRootView() {
        backgroundColor = .clear
    }

    private func setupRootLayer() {
        layer.backgroundColor = UIColor.clear.cgColor
    }

    private func setupSublayers() {
        layer.addSublayer(playerLayer)
    }

    private func computeFrames() {
        playerLayer.frame = bounds
    }
}
