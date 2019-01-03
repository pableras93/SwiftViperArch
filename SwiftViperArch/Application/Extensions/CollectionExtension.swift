//
//  CollectionExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 03/01/2019.
//  Copyright © 2019 Pablo Barcos. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    public subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
