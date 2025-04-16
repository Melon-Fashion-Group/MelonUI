//
//  MLNTree+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - View+

extension View {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 17.0, *)
    public func treeStyle<TreeStyle: DisclosureGroupStyle>(_ style: TreeStyle) -> some View {
        self.disclosureGroupStyle(style)
    }
}
