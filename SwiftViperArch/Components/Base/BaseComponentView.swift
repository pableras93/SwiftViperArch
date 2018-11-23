//
//  BaseComponentView.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

protocol BaseComponentViewProtocol {
    func componentViewDidLoad()
}

@IBDesignable
class BaseComponentView: UIView, BaseComponentViewProtocol {
    
    //MARK: public methods
    public class func instanceFromNib() -> BaseComponentView {
        let view = BaseComponentView()
        view.xibSetup()
        return view;
    }
    var selfView:UIView?
    
    //MARK: BaseComponentViewProtocol
    func componentViewDidLoad() {
        print("ComponentViewLoaded", String(describing: self))
    }
    
    //MARK: initializers
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    deinit {
        print("")
    }
    
    //MARK: other methods
    private func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:[], metrics: nil, views: ["view": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options:[], metrics: nil, views: ["view": view]))
        selfView = view
        self.componentViewDidLoad()
    }
    
    private func loadViewFromNib() -> UIView? {
        if let view = selfView {
            return view
        } else {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: type(of: self).nibName(), bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
            // if you have a crash here you probably should remove the custom class from your root UIView in the xib file and have it in the file owner
        }
    }
    
    class func nibName() -> String {
        return String(describing: self)
    }
}
