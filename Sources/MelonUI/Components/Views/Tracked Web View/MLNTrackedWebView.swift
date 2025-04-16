//
//  MLNTrackedWebView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 11.03.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI
import WebKit



// MARK: - MLNTrackedWebView

///
///
///
@available(iOS 17.0, *)
public struct MLNTrackedWebView: UIViewRepresentable {

    // MARK: - Private properties

    private let request: URLRequest
    @Binding private var contentState: ContentState



    // MARK: - Init

    ///
    ///
    ///
    public init(
        request: URLRequest,
        state contentState: Binding<ContentState>) {
        self.request = request
        _contentState = contentState
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func makeCoordinator() -> Coordinator { .init(state: $contentState) }

    ///
    ///
    ///
    public func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()

        configuration.allowsInlineMediaPlayback = true

        let webView = WKWebView(frame: .zero, configuration: configuration)

        webView.allowsBackForwardNavigationGestures = false
        webView.allowsLinkPreview = false
        webView.underPageBackgroundColor = .clear
        webView.navigationDelegate = context.coordinator

        return webView
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
        if contentState == .loading {
            webView.load(request)
        }
    }
}
