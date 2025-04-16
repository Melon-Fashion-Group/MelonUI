//
//  MLNAsyncVideoPlayer.AsyncVideoPlayerStyle.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 17.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import MelonKit
import SwiftUI



// MARK: - MLNAsyncVideoPlayer.AsyncVideoPlayerStyle

extension MLNAsyncVideoPlayer {

    ///
    ///
    ///
    public struct AsyncVideoPlayerStyle: Sendable {
        let transition: AnyTransition?
        let videoGravity: AVLayerVideoGravity

        ///
        ///
        ///
        public init(
            transition: AnyTransition? = .asymmetric(
                insertion: .scale(scale: 1.05),
                removal: .scale(scale: 0.95)
            ).combined(with: .opacity).animation(.smooth(duration: 0.3)),
            videoGravity: MLNVideoPlayer.VideoScaling = .aspectFill
        ) {
            self.transition = transition
            self.videoGravity = switch videoGravity {
            case .resize: .resize
            case .aspectFit: .resizeAspect
            case .aspectFill: .resizeAspectFill
            }
        }
    }
}
