//
//  MLNTree.ContentView.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 07.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNTree.ContentView

extension MLNTree {
    struct ContentView: View {
        private let content: MLNTreeComposable

        @State private var isExpanded: Bool
        private let isRootFolderVisible: Bool

        private let file: (MLNTreeComposable) -> File
        private let folder: (MLNFolder) -> Folder

        var body: some View {
            if let folder = (content as? MLNFolder) {
                if isRootFolderVisible {
                    renderTreeContentViewWithRootFolder(folder)
                } else {
                    renderTreeContentViewWithoutRootFolder(folder)
                }
            } else {
                file(content)
            }
        }

        init(
            content: MLNTreeComposable,
            isExpanded: Bool,
            isRootFolderVisible: Bool = true,
            file: @escaping (MLNTreeComposable) -> File,
            folder: @escaping (MLNFolder) -> Folder
        ) {
            self.content = content

            _isExpanded = .init(initialValue: isExpanded)
            self.isRootFolderVisible = isRootFolderVisible

            self.file = file
            self.folder = folder
        }
    }
}



// MARK: - UI

extension MLNTree.ContentView {
    private func renderTreeContentViewWithRootFolder(_ folder: MLNFolder) -> some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            treeContentViewTraversal(folder)
        } label: {
            self.folder(folder)
        }
    }

    private func renderTreeContentViewWithoutRootFolder(_ folder: MLNFolder) -> some View {
        treeContentViewTraversal(folder)
    }

    private func treeContentViewTraversal(_ folder: MLNFolder) -> some View {
        ForEach(folder.contents.indices, id: \.self) { index in
            Self(content: folder.contents[index], isExpanded: isExpanded) {
                self.file($0)
            } folder: {
                self.folder($0)
            }
        }
    }
}
