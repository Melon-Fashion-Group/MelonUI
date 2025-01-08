//
//  MLNToast+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNToast+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func toast(store: MLNToastStore) -> some View {
        modifier(ToastViewModifier(store: store))
    }
}
