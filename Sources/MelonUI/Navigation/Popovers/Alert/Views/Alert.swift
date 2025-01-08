//
//  Alert.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - Alert

@available(iOS 17.0, *)
struct Alert<Content: View>: View {
    private let isPresented: Bool
    private let content: Content

    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .opacity(isPresented ? 1 : .zero)
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
    }

    init(
        isPresented: Bool,
        content: () -> Content
    ) {
        self.isPresented = isPresented
        self.content = content()
    }
}
