//
//  MLNSafariWebView.Coordinator.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SafariServices



// MARK: - MLNSafariWebView.Coordinator

extension MLNSafariWebView {

    ///
    ///
    ///
    @MainActor public final class Coordinator: NSObject, @preconcurrency SFSafariViewControllerDelegate {
        private let parent: MLNSafariWebView

        init(_ parent: MLNSafariWebView) {
            self.parent = parent
        }



        // MARK: - Public methods

        ///
        ///
        ///
        public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
