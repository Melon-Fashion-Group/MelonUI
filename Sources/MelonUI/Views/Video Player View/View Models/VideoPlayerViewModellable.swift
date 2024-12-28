//
//  VideoPlayerViewModellable.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - VideoPlayerViewModellable

@MainActor
@available(iOS 16.0, *)
protocol VideoPlayerViewModellable: ObservableObject {
    var state: VideoPlayerVM.State { get }

    init(request urlRequest: URLRequest)

    func load(_ completion: (_ fileURL: URL) -> Void) async
    func reload(_ completion: (_ fileURL: URL) -> Void) async
}
