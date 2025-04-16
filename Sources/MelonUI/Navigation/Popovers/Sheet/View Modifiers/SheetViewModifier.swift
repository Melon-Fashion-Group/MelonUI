//
//  SheetViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - SheetViewModifier

@available(iOS 17.0, *)
struct SheetViewModifier: ViewModifier {
    @Bindable private var store: MLNSheetStore

    func body(content: Content) -> some View {
        content.sheet(isPresented: $store.isPresented) { store.view }
    }

    init(store: MLNSheetStore) {
        self.store = store
    }
}
