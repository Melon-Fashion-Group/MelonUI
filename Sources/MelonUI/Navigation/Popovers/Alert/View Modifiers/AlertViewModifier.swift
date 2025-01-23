//
//  MLNAlert+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 08.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - AlertViewModifier

@available(iOS 17.0, *)
struct AlertViewModifier: ViewModifier {
    @Bindable private var store: MLNAlertStore
    private let identifier = String(describing: Self.self)

    func body(content: Content) -> some View {
        content.onChange(of: store.isPresented) {
            guard store.isPresented else { return }

            let window = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })

            if let window {
                let view = Alert(isPresented: $store.isPresented) {
                    removeChildVC(from: window)
                } content: {
                    store.view
                }

                let viewController = UIHostingController(rootView: view)
                addChildVC(viewController, to: window)
            }
        }
    }

    init(store: MLNAlertStore) {
        self.store = store
    }

    private func removeChildVC(from window: UIWindow) {
        guard let viewController = window.rootViewController?.children
            .first(where: { $0.title == identifier })
        else { return }

        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }

    private func addChildVC(_ viewController: UIViewController, to window: UIWindow) {
        viewController.title = identifier

        viewController.view.frame = window.rootViewController?.view.bounds ?? .zero
        viewController.view.backgroundColor = .clear
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        window.rootViewController?.view.addSubview(viewController.view)
        window.rootViewController?.addChild(viewController)
    }
}
