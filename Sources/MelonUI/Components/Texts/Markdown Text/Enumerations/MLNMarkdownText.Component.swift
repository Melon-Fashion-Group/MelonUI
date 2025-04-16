//
//  MLNMarkdownText.Component.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 26.03.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNMarkdownText.Component

extension MLNMarkdownText {
    public enum Component {

        ///
        ///
        ///
        case text(_ text: String.LocalizationValue, bundle: Bundle? = nil, options: Set<Option> = [])

        ///
        ///
        ///
        case link(_ text: String.LocalizationValue, url: String, bundle: Bundle? = nil, options: Set<Option> = [.bold])
    }
}
