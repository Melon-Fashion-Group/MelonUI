//
//  MLNTree.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTree

///
///
///
@available(iOS 17.0, *)
public struct MLNTree<File: View, Folder: View>: View {

    // MARK: - Private properties

    private let content: MLNTreeComposable

    private let isExpandedByDefault: Bool
    private let isRootFolderVisible: Bool

    private let file: (MLNTreeComposable) -> File
    private let folder: (MLNFolder) -> Folder



    // MARK: - Body

    public var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: .zero) {
                ContentView(
                    content: content,
                    isExpanded: isExpandedByDefault,
                    isRootFolderVisible: isRootFolderVisible,
                    file: file,
                    folder: folder
                )
            }
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        content: MLNTreeComposable,
        isExpandedByDefault: Bool = false,
        isRootFolderVisible: Bool = true,
        @ViewBuilder file: @escaping (MLNTreeComposable) -> File,
        @ViewBuilder folder: @escaping (MLNFolder) -> Folder
    ) {
        self.content = content

        self.isExpandedByDefault = isExpandedByDefault
        self.isRootFolderVisible = isRootFolderVisible

        self.file = file
        self.folder = folder
    }
}
