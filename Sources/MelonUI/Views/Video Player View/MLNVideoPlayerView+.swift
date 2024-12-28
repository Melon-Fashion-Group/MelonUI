//
//  MLNVideoPlayerView+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import AVKit
import MelonKit
import SwiftUI



// MARK: - EnvironmentValues+

extension EnvironmentValues {
    @available(iOS 16.0, *)
    private struct VideoGravityKey: EnvironmentKey {
        static let defaultValue: AVLayerVideoGravity = .resizeAspect
    }

    @available(iOS 16.0, *)
    var videoGravity: AVLayerVideoGravity {
        get { self[VideoGravityKey.self] }
        set { self[VideoGravityKey.self] = newValue }
    }
}



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public func playerVideoScaling(_ scaling: MLNVideoPlayer.VideoScaling) -> some View {
        let videoGravity: AVLayerVideoGravity = switch scaling {
        case .resize: .resize
        case .aspectFit: .resizeAspect
        case .aspectFill: .resizeAspectFill
        }

        return environment(\.videoGravity, videoGravity)
    }
}
