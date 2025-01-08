//
//  PopupViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - PopupViewModifier

@available(iOS 17.0, *)
struct PopupViewModifier: ViewModifier {
    @Bindable private var store: MLNPopupStore

    func body(content: Content) -> some View {
        content.overlay {
            Popup(isPresented: $store.isPresented) { store.view }
        }
    }

    init(store: MLNPopupStore) {
        self.store = store
    }
}
