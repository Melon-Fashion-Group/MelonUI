//
//  StatusBarTapDetectorView+.swift
//  Melon Fashion UI
//
//  Created by Dimka Novikov on 27.01.2025.
//  Copyright © 2025 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - StatusBarTapDetectorView+

extension StatusBarTapDetectorView {
    final class Coordinator: NSObject, UIScrollViewDelegate {
        private let action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
            action()

            return false
        }
    }
}
