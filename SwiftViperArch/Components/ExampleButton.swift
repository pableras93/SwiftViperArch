//
//  ExampleButton.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

class ExampleButton: UIButton {
    
    var style: ExampleButtonStyle = .defaults {
        didSet {
            setValues()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setValues()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setValues()
    }
    
    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            setValues()
        }
    }
    
    private func setValues() {
        
        // Color
        if isEnabled {
            backgroundColor = style.backgroundColor
            setTitleColor(style.textColor, for: .normal)
            tintColor = style.tintColor
        }else {
            backgroundColor = style.disabledBackgroundColor
            setTitleColor(style.disabledTextColor, for: .normal)
            tintColor = style.disabledTintColor
        }
        
        // Font
        titleLabel?.font = style.textFont
        
        // Layer
        layer.cornerRadius = style.cornerRadius
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor
    }
}


// TODO: HAY QUE COMPLETAR EL RESTO DE LOS ESTILOS QUE PUEDA TENER EL CONTROL
enum ExampleButtonStyle: ButtonStyleProtocol {
    
    case defaults/*, inverted*/
    var tintColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().tintColor
        //case .inverted: return MSMButtonDefaultsStyle().tintColor
        default: return ExampleButtonDefaultsStyle().tintColor
        }
    }
    
    var textColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().textColor
        //case .inverted: return MSMButtonDefaultsStyle().textColor
        default: return ExampleButtonDefaultsStyle().textColor
        }
    }
    
    var textFont: UIFont {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().textFont
        //case .inverted: return MSMButtonDefaultsStyle().textFont
        default: return ExampleButtonDefaultsStyle().textFont
        }
    }
    
    var disabledBackgroundColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().disabledBackgroundColor
        //case .inverted: return MSMButtonDefaultsStyle().disabledBackgroundColor
        default: return ExampleButtonDefaultsStyle().disabledBackgroundColor
        }
    }
    
    var disabledTintColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().disabledTintColor
        //case .inverted: return MSMButtonDefaultsStyle().disabledTintColor
        default: return ExampleButtonDefaultsStyle().disabledTintColor
        }
    }
    
    var disabledTextColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().disabledTextColor
        //case .inverted: return MSMButtonDefaultsStyle().disabledTextColor
        default: return ExampleButtonDefaultsStyle().disabledTextColor
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().backgroundColor
        //case .inverted: return MSMButtonDefaultsStyle().backgroundColor
        default: return ExampleButtonDefaultsStyle().backgroundColor
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().borderWidth
        //case .inverted: return MSMButtonDefaultsStyle().borderWidth
        default: return ExampleButtonDefaultsStyle().borderWidth
        }
    }
    
    var borderColor: CGColor {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().borderColor
        //case .inverted: return MSMButtonDefaultsStyle().borderColor
        default: return ExampleButtonDefaultsStyle().borderColor
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
            //case .defaults: return MSMButtonDefaultsStyle().cornerRadius
        //case .inverted: return MSMButtonDefaultsStyle().cornerRadius
        default: return ExampleButtonDefaultsStyle().cornerRadius
        }
    }
    
}


