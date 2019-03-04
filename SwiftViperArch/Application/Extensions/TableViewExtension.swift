//
//  TableViewExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 04/03/2019.
//  Copyright © 2019 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit


protocol Reusable {}

extension UITableViewCell: Reusable {
    
}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}



extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}
