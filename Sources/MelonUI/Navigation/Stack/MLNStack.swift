//
//  MLNStack.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 31.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNStack

///
///
///
@available(iOS 16.0, *)
public struct MLNStack: View {

    // MARK: - Private properties

    @ObservedObject private var store: MLNStackStore



    // MARK: - Body

    public var body: some View {
        NavigationStack(path: $store.views) {

        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(store: MLNStackStore) {
        self.store = store
    }
}
