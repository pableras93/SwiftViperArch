//
//  GeneralProtocols.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - General protocols
/**
 Used to return general values used in the application.
 - keychainAccount: Used to set the account keychain value.
 */
protocol GeneralInfoProtocol {
    static var keychainAccount: String { get }
    static var userDefaultsSuiteName: String { get }
}

// MARK: - Network protocols
/**
 Used to return the mandatory values that are required to send in all network services.
 */
protocol NetworkConfigProtocol {
    var baseURL: String { get }

}

/**
 Used to return the services values that are necesary for every network connection.
 */
protocol NetworkServiceProtocol {
    var path: String { get }
    var url: String { get }
    var type: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

protocol CellProtocol {
    static var reuseIdentifier: String { get }
}

// MARK: - Color protocols
protocol AppColorsPaletteProtocol {
    static var primary: UIColor { get }
    static var primaryInverse: UIColor { get }
}

protocol AppFontsProtocol {
    static var mainRegularWithDefaultSize: UIFont { get }
    static var mainLightWithDefaultSize: UIFont { get }
    static var mainMediumWithDefaultSize: UIFont { get }
    static var mainBoldWithDefaultSize: UIFont { get }
}

protocol AppFontSizesProtocol {
    static var fontSizeDefault: CGFloat { get }
}

protocol AppImagesProtocol {
    static var splashBanner: UIImage { get }
}


// MARK: - Components protocols
/**
 Used to set the style relative for a component border.
 */
protocol ComponentLayerStyleProtocol {
    var borderWidth: CGFloat { get }
    var borderColor: CGColor { get }
    var cornerRadius: CGFloat { get }
}

/**
 Used to set the style relative for a component.
 */
protocol ComponentStyleProtocol: ComponentLayerStyleProtocol {
    var backgroundColor: UIColor { get }
}

/**
 Used to set the style relative for a control.
 */
protocol ControlStyleProtocol: ComponentStyleProtocol {
    var tintColor: UIColor { get }
    var textColor: UIColor { get }
    var textFont: UIFont { get }
    
    // Disabled state
    var disabledBackgroundColor: UIColor { get }
    var disabledTintColor: UIColor { get }
    var disabledTextColor: UIColor { get }
}

/**
 Used to set the style relative for a button.
 */
protocol ButtonStyleProtocol: ControlStyleProtocol {
}

/**
 Used to set the style relative for a label.
 */
protocol LabelStyleProtocol: ControlStyleProtocol {
}

/**
 Used to set the style relative for a textField.
 */
protocol TextFieldStyleProtocol: ControlStyleProtocol {
}


