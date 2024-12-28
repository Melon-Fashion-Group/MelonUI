//
//  MLNPageTabView+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNPageTabView+

extension EnvironmentValues {
    private struct SafeAreaIgnoresKey: EnvironmentKey {
        static let defaultValue: Bool = false
    }

    var isSafeAreaIgnored: Bool {
        get { self[SafeAreaIgnoresKey.self] }
        set { self[SafeAreaIgnoresKey.self] = newValue }
    }
}


extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS, introduced: 16.0, deprecated: 17.0, message: "Used only with the MLNPageTabView UI component")
    public func pageTabViewSafeAreaIgnored() -> some View {
        environment(\.isSafeAreaIgnored, true)
    }
}
