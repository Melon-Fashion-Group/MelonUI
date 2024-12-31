//
//  MLNPopoverViewModifier.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNPopoverViewModifier

struct MLNPopoverViewModifier: ViewModifier {
    private let store: MLNPopoverStore

    func body(content: Content) -> some View {
        content
            .popover(
                type: store.popover.type,
                isPresented: .init(
                    get: { store.isPresented },
                    set: { store.isPresented = $0 }
                )
            ) {
                store.popover.view
            }
    }

    init(store: MLNPopoverStore) {
        self.store = store
    }
}
