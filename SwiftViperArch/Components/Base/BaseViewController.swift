//
//  BaseViewController.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: ViperViewController {
    
    var scrollViews = [UIScrollView]()
    
    // Textfield and keyboard related
    var activeField: UITextField?
    var lastScrollViewOffset: CGPoint?
    
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewTappedGR = UITapGestureRecognizer(target: self, action: #selector(viewIsTappedAction(_:)))
        viewTappedGR.cancelsTouchesInView = false
        view.addGestureRecognizer(viewTappedGR)
        
        // Checking if viewController has scrollView
        scrollViews = getScrollViews()
        if scrollViews.count > 0  {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        
        // Notification for controling the change of language in the app.
        if self is ViperInterfaceProtocol {
            
            NotificationCenter.default.addObserver(forName: NSLocale.currentLocaleDidChangeNotification, object: nil, queue: OperationQueue.main) {
                [weak self] notification in
                guard let `self` = self else { return }
                
                //  Calling the method that updates all localizable strings
                (self as! ViperInterfaceProtocol).updateStrings()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - Helper methods
    
}

extension BaseViewController {
    
    private func getScrollViews() -> [UIScrollView] {
        return findScrollViewsInView(view)
    }
    
    
    /**
     Find all scrollView elements that exits inside the given view
     
     - parameter view: The parent view that may contain scrollView elements.
     - parameter previousScrollViews: A collection of pre-existing scrollviews in another view hierarchy.
     
     - returns: An array of scrollviews existing inside the view.
     */
    private func findScrollViewsInView(_ view: UIView) -> [UIScrollView] {
        
        var scrollViews = [UIScrollView]()
        for subview in view.subviews {
            if subview is UIScrollView {
                scrollViews.append(subview as! UIScrollView)
            }
            scrollViews += findScrollViewsInView(subview)
        }
        return scrollViews
    }
    
    private func scrollViewParent(of textField: UITextField) -> UIScrollView? {
        
        for scrollView in scrollViews.reversed() { // Using 'reversed' for starting from the lower tree hierarchy
            if textField.isDescendant(of: scrollView) {
                return scrollView
            }
        }
        return nil
    }
    
    @objc private func viewIsTappedAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}


extension BaseViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    
    @objc func keyboardWillBeShown(notification: NSNotification) {
        
        //Need to calculate keyboard exact size due to Apple suggestions
        guard let info = notification.userInfo,
            let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size,
            let keyboardAnimationDuration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let activeFieldPresent = activeField,
            let scrollView = scrollViewParent(of: activeFieldPresent),
            let textFieldGlobalFrame = activeFieldPresent.superview?.convert(activeFieldPresent.frame, to: view)
            else { return }
        
        lastScrollViewOffset = scrollView.contentOffset
        let keyboardFrame = CGRect(x: 0.0, y: view.frame.height - keyboardSize.height, width: keyboardSize.width, height: keyboardSize.height)
        var newScrollViewOffset = CGPoint(x: 0.0, y: textFieldGlobalFrame.origin.y + textFieldGlobalFrame.size.height - keyboardFrame.origin.y)
        if newScrollViewOffset.y > 0 {
            newScrollViewOffset.y = newScrollViewOffset.y + scrollView.contentOffset.y
            if activeFieldPresent.autocorrectionType != .no {
                newScrollViewOffset.y = newScrollViewOffset.y + 40
            }
            
            UIView.animate(withDuration: keyboardAnimationDuration, animations: {
                scrollView.setContentOffset(newScrollViewOffset, animated: false)
            }) { (finished) in
            }
            
        }
    }
    
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        
        //Once keyboard disappears, restore original positions
        guard let  info = notification.userInfo,
            let keyboardAnimationDuration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let activeFieldPresent = activeField,
            let scrollView = scrollViewParent(of: activeFieldPresent)
            else { return }
        
        UIView.animate(withDuration: keyboardAnimationDuration, animations: {
            scrollView.setContentOffset(self.lastScrollViewOffset ?? CGPoint(x: 0, y: 0), animated: false)
        }) { (finished) in
            self.lastScrollViewOffset = nil
        }
        
    }
}



