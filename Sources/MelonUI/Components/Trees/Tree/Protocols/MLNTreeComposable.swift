//
//  MLNTreeComposable.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTreeComposable

///
///
///
@available(iOS 17.0, *)
public protocol MLNTreeComposable: AnyObject {

    // MARK: - Public properties

    ///
    ///
    ///
    var name: String { get set }

    ///
    ///
    ///
    var label: String? { get }

    ///
    ///
    ///
    var color: Color? { get }
}
