//
//  MLNFolder.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNFolder

///
///
///
@available(iOS 17.0, *)
public final class MLNFolder: MLNTreeComposable {

    // MARK: - Public properties

    ///
    ///
    ///
    public var name: String

    ///
    ///
    ///
    public let label: String?

    ///
    ///
    ///
    public let color: Color?

    ///
    ///
    ///
    public var count: Int { contents.count }

    ///
    ///
    ///
    public private(set) var contents: [MLNTreeComposable] = []



    // MARK: - Init

    ///
    ///
    ///
    public init(
        name: String,
        label: String? = nil,
        color: Color? = nil
    ) {
        self.name = name
        self.label = label
        self.color = color
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func addContent(_ content: MLNTreeComposable) {
        contents.append(content)
    }
}
