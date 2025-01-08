//
//  ToastViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - ToastViewModifier

@available(iOS 17.0, *)
struct ToastViewModifier: ViewModifier {
    @Bindable private var store: MLNToastStore

    func body(content: Content) -> some View {
        content.overlay(alignment: .top) {
            Toast(placement: store.placement, isPresented: $store.isPresented) { store.view }
        }
    }

    init(store: MLNToastStore) {
        self.store = store
    }
}
