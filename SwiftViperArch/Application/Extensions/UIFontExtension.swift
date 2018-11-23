//
//  UIFontExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

extension UIFont: AppFontsProtocol {
    static var mainRegularWithDefaultSize: UIFont { return AppFonts.mainRegularWithDefaultSize }
    
    static var mainLightWithDefaultSize: UIFont { return AppFonts.mainLightWithDefaultSize }
    
    static var mainMediumWithDefaultSize: UIFont { return AppFonts.mainMediumWithDefaultSize }
    
    static var mainBoldWithDefaultSize: UIFont { return AppFonts.mainBoldWithDefaultSize }
}
