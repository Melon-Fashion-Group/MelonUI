//
//  MLNMarkdownText.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 15.03.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import MelonKit
import SwiftUI



// MARK: - MLNMarkdownText

///
///
///
@available(iOS 17.0, *)
public struct MLNMarkdownText: View {

    // MARK: - Private properties

    private var attributedString: AttributedString!



    // MARK: - Body

    public var body: some View {
        Text(attributedString)
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        separator: String = .empty,
        _ components: Component...
    ) {
        attributedString = createAttributedString(from: components, with: separator)
    }



    // MARK: - Private properties

    private func createAttributedString(
        from components: [Component],
        with separator: String
    ) -> AttributedString {
        let attributedString = components
            .map { createMarkdownedText(from: $0) }
            .joined(with: separator)

        return attributedString
    }

    private func createMarkdownedText(from component: Component) -> AttributedString {
        switch component {
        case .text(let text, let bundle, let options):
            let text = String(localized: text, bundle: bundle)
            let sortedOptions = options.sorted { $0.rawValue < $1.rawValue }
            let markdownedText = applyMarkdown(to: text, with: sortedOptions)

            return markdownedText
        case .link(let text, let url, let bundle, let options):
            let title = String(localized: text, bundle: bundle)
            let link = "[\(title)](\(url))"
            let sortedOptions = options.sorted { $0.rawValue < $1.rawValue }
            let filteredOptions = sortedOptions.filter { $0 != .monospace }
            let markdownedLink = applyMarkdown(to: link, with: filteredOptions)

            return markdownedLink
        }
    }

    private func applyMarkdown(to text: String, with options: [Option]) -> AttributedString {
        let markdownOptions = options.filter { $0.rawValue < 3 }
        let attributeOptions = options.filter { $0.rawValue > 2 }
        let markdownedString = applyMarkdownOptions(to: text, with: markdownOptions)
        let attributedString = applyAttributeOptions(to: markdownedString, with: attributeOptions)

        return attributedString
    }

    private func applyMarkdownOptions(to text: String, with options: [Option]) -> AttributedString {
        var markdownedText = text

        options.forEach { option in
            switch option {
            case .monospace: markdownedText = "`\(markdownedText)`"
            case .bold: markdownedText = "**\(markdownedText)**"
            case .italic: markdownedText = "_\(markdownedText)_"
            default: break
            }
        }

        return try! .init(markdown: markdownedText)
    }

    private func applyAttributeOptions(to text: AttributedString, with options: [Option]) -> AttributedString {
        var attributedString = text

        options.forEach { option in
            switch option {
            case .strikethrough: attributedString.strikethroughStyle = .single
            case .underline: attributedString.underlineStyle = .single
            default: break
            }
        }

        return attributedString
    }
}
