//
//  MLNTrackedWebView.Coordinator.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 11.03.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI
import WebKit



// MARK: - MLNTrackedWebView.Coordinator

extension MLNTrackedWebView {

    ///
    ///
    ///
    @MainActor public final class Coordinator: NSObject, WKNavigationDelegate {
        @Binding private var contentState: ContentState

        init(state contentState: Binding<ContentState>) {
            _contentState = contentState
        }



        // MARK: - Public methods

        ///
        ///
        ///
        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            contentState = .loading
        }

        ///
        ///
        ///
        public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
            contentState = .error
        }

        ///
        ///
        ///
        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            contentState = .loaded
        }
    }
}
