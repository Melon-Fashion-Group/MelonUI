//
//  MLNPopoverToast.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNPopoverToast

struct MLNPopoverToast<Content: View>: View {
    private let edge: MLNPopover.ToastEdge
    @Binding private var isPresented: Bool
    private let content: Content

    @State private var timeRemaining: UInt8 = 3
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Group {
            switch edge {
            case .top: topToastView
            case .bottom: bottomToastView
            }
        }
        .onReceive(timer) { _ in
            if timeRemaining > .zero {
                timeRemaining -= 1
            } else if timeRemaining == .zero {
                hide()
            }
        }
    }

    init(
        edge: MLNPopover.ToastEdge,
        isPresented: Binding<Bool>,
        content: () -> Content
    ) {
        self.edge = edge
        _isPresented = isPresented
        self.content = content()
    }

    private func hide() {
        withAnimation(.smooth(duration: 0.3)) {
            isPresented = false
        } completion: {
            timeRemaining = 5
        }
    }
}



// MARK: - UI

extension MLNPopoverToast {
    private var topToastView: some View {
        VStack(spacing: .zero) {
            if isPresented {
                content
                    .onTapGesture { hide() }
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .top),
                            removal: .move(edge: .top)
                        )
                        .combined(with: .opacity)
                    )
            }

            Spacer()
        }
    }

    private var bottomToastView: some View {
        VStack(spacing: .zero) {
            Spacer()

            if isPresented {
                content
                    .onTapGesture { hide() }
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .top),
                            removal: .move(edge: .top)
                        )
                        .combined(with: .opacity)
                    )
            }
        }
    }
}
