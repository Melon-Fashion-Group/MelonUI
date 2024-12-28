// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.


//
//  Package.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 18.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import PackageDescription



// MARK: - Package

let package = Package(
    name: "Melon Fashion UI",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MelonUI",
            targets: ["MelonUI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Melon-Fashion-Group/MelonKit", from: "0.22.2")
    ],
    targets: [
        .target(
            name: "MelonUI",
            dependencies: [
                .product(name: "MelonKit", package: "MelonKit")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
