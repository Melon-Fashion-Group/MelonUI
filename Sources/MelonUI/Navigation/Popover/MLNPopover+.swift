//
//  MLNPopover+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - View+

extension View {

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func popover(store: MLNPopoverStore) -> some View {
        modifier(MLNPopoverViewModifier(store: store))
    }

    @available(iOS 17.0, *)
    @ViewBuilder func popover<Content: View>(
        type presentationType: MLNPopover.PresentationType,
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        switch presentationType {
        case .alert: self.overlay { MLNPopoverAlert(isPresented: isPresented.wrappedValue, content: content) }
        case .cover: self.fullScreenCover(isPresented: isPresented, content: content)
        case .popup: self.overlay { MLNPopoverPopup(isPresented: isPresented, content: content) }
        case .sheet: self.sheet(isPresented: isPresented, content: content)
        case .toast(edge: let edge): self.overlay { MLNPopoverToast(edge: edge, isPresented: isPresented, content: content) }
        }
    }
}
