//
//  Popup.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - Popup

@available(iOS 17.0, *)
struct Popup<Content: View>: View {
    @Binding private var isPresented: Bool
    private let action: () -> Void
    private let content: Content

    @State private var offset: CGFloat = .zero
    @State private var isShowed = false

    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
            .opacity(isShowed ? 1 : .zero)
            .onTapGesture { hide() }
            .overlay(alignment: .bottom) {
                if isShowed {
                    content
                        .offset(y: offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.startLocation.y < gesture.location.y {
                                        offset = gesture.translation.height
                                    }
                                }
                                .onEnded { gesture in
                                    if gesture.translation.height > 100 { hide() } else { reset() }
                                }
                        )
                        .transition(.move(edge: .bottom).combined(with: .opacity))
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
        content: () -> Content
    ) {
        _isPresented = isPresented
        self.action = action
        self.content = content()
    }

    private func hide(isShowed: Bool = false) {
        withAnimation(.interactiveSpring(duration: 0.3)) {
            self.isShowed = isShowed
        } completion: {
            isPresented = isShowed

            action()
        }
    }

    private func show() {
        withAnimation(.interactiveSpring(duration: 0.3)) {
            isShowed = isPresented
        }
    }

    private func reset() {
        withAnimation(.interactiveSpring(duration: 0.3)) {
            offset = .zero
        }
    }
}
