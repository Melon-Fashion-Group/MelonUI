//
//  MLNSafariWebView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SafariServices
import SwiftUI



// MARK: - MLNSafariWebView

///
///
///
@available(iOS 16.0, *)
public struct MLNSafariWebView: UIViewControllerRepresentable {

    // MARK: - Public typealiases

    ///
    ///
    ///
    public typealias Action = () -> Void



    // MARK: - Private properties

    private let url: URL
    private let action: Action



    // MARK: - Init

    ///
    ///
    ///
    public init(
        url: URL,
        completion action: @escaping Action
    ) {
        self.url = url
        self.action = action
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func makeCoordinator() -> Coordinator { .init(action: action) }

    ///
    ///
    ///
    public func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = context.coordinator

        return safariVC
    }

    ///
    ///
    ///
    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}
