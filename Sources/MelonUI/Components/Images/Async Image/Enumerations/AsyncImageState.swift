//
//  AsyncImageState.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 16.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - AsyncImageState

@available(iOS 17.0, *)
@MainActor enum AsyncImageState {
    case loading
    case error
    case loaded(image: UIImage)
}
