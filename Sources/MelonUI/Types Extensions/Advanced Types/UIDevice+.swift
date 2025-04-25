//
//  UIDevice+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 25.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - UIDevice+

extension UIDevice {

    // MARK: - Public properties

    @available(iOS 17.0, *)
    static let onShakeGestureName = Notification.Name(rawValue: "OnShakeGesture")
}
