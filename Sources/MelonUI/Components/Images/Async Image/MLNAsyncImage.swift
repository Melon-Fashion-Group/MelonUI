//
//  MLNAsyncImage.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 16.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNAsyncImage

///
///
///
@available(iOS 17.0, *)
public struct MLNAsyncImage<Loader: View, Error: View>: View {

    // MARK: - Private properties

    private let loader: Loader
    private let error: (_ action: @escaping () -> Void) -> Error
    private let completion: (() -> Void)?

    @State private var viewModel: AsyncImageViewModel

    @Environment(\.asyncImageStyle) private var asyncImageStyle



    // MARK: - Body

    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                loader
                    .transition(asyncImageStyle.transition ?? .identity)
            case .error:
                error(reload)
                    .transition(asyncImageStyle.transition ?? .identity)
            case .loaded(let image):
                Image(uiImage: image)
                    .resizable(capInsets: asyncImageStyle.scaling.insets, resizingMode: asyncImageStyle.scaling.resizingMode)
                    .aspectRatio(asyncImageStyle.aspect.ratio, contentMode: asyncImageStyle.aspect.contentMode)
                    .transition(asyncImageStyle.transition ?? .identity)
                    .onAppear(perform: completion)
            }
        }
        .task(priority: .background) {
            await viewModel.load()
        }
    }



    // MARK: - Init

    ///
    ///
    ///
    public init(
        request: URLRequest,
        @ViewBuilder loader: () -> Loader = { EmptyView() },
        @ViewBuilder error: @escaping (_ action: @escaping () -> Void) -> Error = { _ in EmptyView() },
        completion: (() -> Void)? = nil
    ) {
        viewModel = .init(request: request)
        self.loader = loader()
        self.error = error
        self.completion = completion
    }



    // MARK: - Private functions

    private func reload() {
        Task(priority: .background) {
            await viewModel.reload()
        }
    }
}
