//
//  UIViewExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 19/12/2018.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

extension Collection where Element: UIView {
    
    /// Returns an array containing, in order, the views of the sequence that satisfy the given predicate.
    ///
    /// - Parameters:
    ///   - recursive: Boolean that indicates if filtering recursively
    ///   - isIncluded: A closure that takes a view of the sequence as its argument and returns a Boolean value indicating whether the view should be included in the returned array.
    /// - Returns: An array of the views that isIncluded allowed.
    func filter(recursive: Bool = false, _ isIncluded: (UIView) -> Bool) -> [UIView] {
        return reduce(into: []) { partialResult, view in
            if isIncluded(view) {
                partialResult.append(view)
            }
            if recursive, !view.subviews.isEmpty {
                let filteredSubviews = view.findSubviews(recursive: recursive, isIncluded)
                partialResult.append(contentsOf: filteredSubviews)
            }
        }
    }
}

extension UIView {
    
    /// Returns an array containing, in order, the subviews that satisfy the given predicate.
    ///
    /// - Parameters:
    ///   - recursive: Boolean that indicates if filtering the subviews
    ///   - isIncluded: A closure that takes a subview as its argument and returns a Boolean value indicating whether the view should be included in the returned array.
    /// - Returns: An array of the views that isIncluded allowed.
    func findSubviews(recursive: Bool = false, _ isIncluded: (UIView) -> Bool) -> [UIView] {
        return subviews.filter(recursive: recursive, isIncluded)
    }
}
