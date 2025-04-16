//
//  Color+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - Color+

extension Color {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func isDark(for value: CGFloat) -> Bool {
        var red: CGFloat = .zero
        var green: CGFloat = .zero
        var blue: CGFloat = .zero
        var alpha: CGFloat = .zero

        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue

        return luminance < value
    }
}
