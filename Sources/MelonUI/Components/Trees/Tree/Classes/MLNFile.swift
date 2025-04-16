//
//  MLNFile.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNFile

///
///
///
@available(iOS 17.0, *)
open class MLNFile: MLNTreeComposable {

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
}
