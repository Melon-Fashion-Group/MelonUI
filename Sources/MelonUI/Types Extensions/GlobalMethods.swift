//
//  GlobalMethods.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 28.12.2024.
//  Copyright © 2024 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - withAnimation

///
///
///
@available(iOS 16.0, *)
@MainActor public func withAnimation<Result>(
    _ animation: Animation? = .default,
    delay: TimeInterval = 1,
    _ body: @escaping () throws -> Result,
    completion: @escaping () -> Void
) rethrows -> Result {
    if #available(iOS 17.0, *) {
        try withAnimation(animation, completionCriteria: .logicallyComplete, body, completion: completion)
    } else {
        try animateBodyWithCompletion(animation, delay: delay, body, completion: completion)
    }
}

@available(iOS 16.0, *)
@MainActor private func animateBodyWithCompletion<Result>(
    _ animation: Animation?,
    delay: TimeInterval,
    _ body: @escaping () throws -> Result,
    completion: @escaping () -> Void
) rethrows -> Result {
    try withAnimation(animation) {
        let result = try body()

        Task(priority: .userInitiated) {
            let nanoseconds = convertSecondsInNanoseconds(delay)

            try await Task.sleep(nanoseconds: nanoseconds)

            await MainActor.run { completion() }
        }

        return result
    }
}



@MainActor
private func convertSecondsInNanoseconds(_ seconds: TimeInterval) -> UInt64 {
    .init(seconds * 1_000_000_000)
}
