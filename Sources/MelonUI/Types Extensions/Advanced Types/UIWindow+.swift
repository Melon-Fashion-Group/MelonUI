//
//  UIWindow+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 25.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - UIWindow+

extension UIWindow {

    // MARK: - Public properties

    ///
    ///
    ///
    @available(iOS 17.0, *)
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        NotificationCenter.default.post(name: UIDevice.onShakeGestureName, object: nil)
    }
}
