//
//  MLNPopoverAlert.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPopoverAlert

struct MLNPopoverAlert<Content: View>: View {
    private let isPresented: Bool
    private let content: Content

    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .overlay {
                if isPresented {
                    content
                        .transition(
                            .asymmetric(
                                insertion: .scale(scale: 1.2),
                                removal: .opacity
                            )
                        )
                }
            }
            .opacity(isPresented ? 1 : .zero)
    }

    init(
        isPresented: Bool,
        content: () -> Content
    ) {
        self.isPresented = isPresented
        self.content = content()
    }
}
