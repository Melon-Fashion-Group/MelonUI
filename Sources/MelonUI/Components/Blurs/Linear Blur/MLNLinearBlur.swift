//
//  MLNLinearBlur.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 02.04.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNLinearBlur

///
///
///
@available(iOS 17.0, *)
public struct MLNLinearBlur: View {

    // MARK: - Private properties

    private let radius: CGFloat
    private let isEdgesSmoothed: Bool



    // MARK: - Body

    public var body: some View {
        TransparentView()
            .blur(radius: radius, opaque: !isEdgesSmoothed)
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        radius: CGFloat,
        isEdgesSmoothed: Bool = false
    ) {
        self.radius = radius
        self.isEdgesSmoothed = isEdgesSmoothed
    }
}
