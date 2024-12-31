//
//  MLNPopoverPopup.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPopoverPopup

struct MLNPopoverPopup<Content: View>: View {
    @Binding private var isPresented: Bool
    private let content: Content

    @State private var offset: CGFloat = .zero

    var body: some View {
        Color.black.opacity(0.5)
            .onTapGesture { hide() }
            .overlay(alignment: .bottom) {
                if isPresented {
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
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .bottom),
                                removal: .move(edge: .bottom)
                            )
                        )
                }
            }
            .opacity(isPresented ? 1 : .zero)
            .ignoresSafeArea()
    }

    init(
        isPresented: Binding<Bool>,
        content: () -> Content
    ) {
        _isPresented = isPresented
        self.content = content()
    }

    private func hide() {
        withAnimation(.interactiveSpring(duration: 0.3), delay: 0.3) {
            isPresented = false
        } completion: {
            offset = .zero
        }
    }

    private func reset() {
        withAnimation(.interactiveSpring(duration: 0.3)) {
            offset = .zero
        }
    }
}
