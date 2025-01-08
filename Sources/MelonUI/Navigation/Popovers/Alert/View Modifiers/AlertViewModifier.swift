//
//  MLNAlert+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - AlertViewModifier

@available(iOS 17.0, *)
struct AlertViewModifier: ViewModifier {
    @Bindable private var store: MLNAlertStore

    func body(content: Content) -> some View {
        content.overlay {
            Alert(isPresented: store.isPresented) { store.view }
        }
    }

    init(store: MLNAlertStore) {
        self.store = store
    }
}
