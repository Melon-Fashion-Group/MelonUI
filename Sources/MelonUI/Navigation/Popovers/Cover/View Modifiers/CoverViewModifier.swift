//
//  CoverViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - CoverViewModifier

@available(iOS 17.0, *)
struct CoverViewModifier: ViewModifier {
    @Bindable private var store: MLNCoverStore

    func body(content: Content) -> some View {
        content.fullScreenCover(isPresented: $store.isPresented) { store.view }
    }

    init(store: MLNCoverStore) {
        self.store = store
    }
}
