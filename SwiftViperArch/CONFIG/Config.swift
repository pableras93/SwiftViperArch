//
//  Config.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

// MARK: - General
struct GeneralInfo: GeneralInfoProtocol {
    static var keychainAccount: String { return "" }
    static var userDefaultsSuiteName: String { return "" }
}


// MARK: - Network
class NetworkConfigInfo: NetworkBaseConfigInfo {
    override var channelId: String { return "12" }
}


// MARK: - Colors
/**
 Used to define all colors used in the app.
 */
struct AppColorsPalette: AppColorsPaletteProtocol {
    static var primary: UIColor { return .white }
    static var primaryInverse: UIColor { return .black }
}


// MARK: - Fonts
/**
 Used to define all fonts used in the app.
 */
struct AppFonts: AppFontsProtocol {
    static var mainRegularWithDefaultSize: UIFont { return UIFont.systemFont(ofSize: .fontSizeDefault) }
    
    static var mainLightWithDefaultSize: UIFont { return UIFont.systemFont(ofSize: .fontSizeDefault) }
    
    static var mainMediumWithDefaultSize: UIFont { return UIFont.systemFont(ofSize: .fontSizeDefault) }
    
    static var mainBoldWithDefaultSize: UIFont { return UIFont.boldSystemFont(ofSize: .fontSizeDefault) }
}


// MARK: - Fonts sizes
/**
 Used to define all fonts sizes used in the app.
 */
struct AppFontsSizes: AppFontSizesProtocol {
    static var fontSizeDefault: CGFloat { return  15.0 }
}


// MARK: - Images
/**
 Used to define all fonts sizes used in the app.
 */
struct AppImages: AppImagesProtocol {
    static var splashBanner: UIImage { return #imageLiteral(resourceName: "banner") }
}


// MARK: - Components
// MARK: Button
/**
 Used to return defaults style for MSM button class.
 */
class ExampleButtonDefaultsStyle: ButtonStyleProtocol {
    var tintColor: UIColor { return .clear }
    var textColor: UIColor { return UIColor.primaryInverse }
    var textFont: UIFont { return UIFont.mainRegularWithDefaultSize }
    var disabledBackgroundColor: UIColor { return .clear }
    var disabledTintColor: UIColor { return .clear }
    var disabledTextColor: UIColor { return .clear }
    var backgroundColor: UIColor { return UIColor.primary }
    var borderWidth: CGFloat { return 0 }
    var borderColor: CGColor { return UIColor.clear.cgColor }
    var cornerRadius: CGFloat { return 0 }
}


// MARK: Label
/**
 Used to return defaults style for MSM label class.
 */
class ExampleLabelDefaultsStyle: LabelStyleProtocol {
    var tintColor: UIColor { return .clear }
    var textColor: UIColor { return UIColor.primaryInverse }
    var textFont: UIFont { return UIFont.mainRegularWithDefaultSize }
    var disabledBackgroundColor: UIColor { return .clear }
    var disabledTintColor: UIColor { return .clear }
    var disabledTextColor: UIColor { return .clear }
    var backgroundColor: UIColor { return .clear }
    var borderWidth: CGFloat { return 0 }
    var borderColor: CGColor { return UIColor.clear.cgColor }
    var cornerRadius: CGFloat { return 0 }
}

// MARK: TextField
/**
 Used to return defaults style for MSM TextField class.
 */
class ExampleTextFieldDefaultsStyle: TextFieldStyleProtocol {
    var tintColor: UIColor { return .clear }
    var textColor: UIColor { return UIColor.primaryInverse }
    var textFont: UIFont { return UIFont.mainRegularWithDefaultSize }
    var disabledBackgroundColor: UIColor { return .clear }
    var disabledTintColor: UIColor { return .clear }
    var disabledTextColor: UIColor { return .clear }
    var backgroundColor: UIColor { return .clear }
    var borderWidth: CGFloat { return 0 }
    var borderColor: CGColor { return UIColor.clear.cgColor }
    var cornerRadius: CGFloat { return 0 }
}

