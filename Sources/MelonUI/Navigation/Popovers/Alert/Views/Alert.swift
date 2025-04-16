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
    @Binding private var isPresented: Bool
    private let content: Content
    private let action: () -> Void

    @State private var isShowed = false

    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .opacity(isShowed ? 1 : .zero)
            .overlay {
                if isShowed {
                    content
                        .transition(
                            .asymmetric(
                                insertion: .scale(scale: 1.2).combined(with: .opacity),
                                removal: .opacity
                            )
                        )
                }
            }
            .onChange(of: isPresented) { _, isNewPresented in
                if !isNewPresented { hide(isShowed: isNewPresented) }
            }
            .onAppear(perform: show)
    }

    init(
        isPresented: Binding<Bool>,
        action: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        _isPresented = isPresented
        self.action = action
        self.content = content()
    }

    private func show() {
        withAnimation(.bouncy(duration: 0.3)) {
            isShowed = isPresented
        }
    }

    private func hide(isShowed: Bool = false) {
        withAnimation(.bouncy(duration: 0.3)) {
            self.isShowed = isShowed
        } completion: {
            isPresented = isShowed

            action()
        }
    }
}
