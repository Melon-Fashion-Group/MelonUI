//
//  MLNNavigationStack.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNNavigationStack

///
///
///
@available(iOS 17.0, *)
public struct MLNNavigationStack: View {

    // MARK: - Private properties

    @ObservedObject private var store: MLNNavigationStackStore



    // MARK: - Body

    public var body: some View {
        if let rootView = store.rootItem?.view {
            NavigationStack(path: $store.items) {
                rootView
                    .toolbar(.hidden, for: .navigationBar)
                    .navigationDestination(for: MLNNavigationStackItem.self) { $0.view }
            }
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(store: MLNNavigationStackStore) {
        self.store = store
    }
}
