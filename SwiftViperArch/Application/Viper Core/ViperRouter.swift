//
//  ViperRouter.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

class ViperRouter: NSObject {
    
    // MARK: Heritable methods
    
    /**
     Shows given viewController as root of the window application.
     
     - parameter viewController: ViewController to show as root ViewController.
     */
    internal func showRootViewController(_ viewController: UIViewController) {
        getWindow().rootViewController = viewController
    }
    
    /**
     Shows given viewController as root of the window application, using a NavigationViewController as parent.
     
     - parameter viewController: ViewController to show as root ViewController inside the NavigationViewController.
     */
    internal func showRootViewControllerWithNavigation(_ viewController: UIViewController) {
        let navigationVC = UINavigationController()
        navigationVC.viewControllers = [viewController]
        getWindow().rootViewController = navigationVC
    }
    
    
    
    /**
     Push a viewController with the rootViewController.
     
     - parameter viewController: ViewController to push.
     - parameter animated: bool if is animated or not.
     */
    internal func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let navigationVC = navigationControllerFromWindow()
        navigationVC.pushViewController(viewController, animated: animated)
    }
    
    /**
     Present modal.
     
     - parameter viewController: ViewController to push.
     - parameter animated: bool if is animated or not.
     */
    internal func presentViewController(_ viewController: UIViewController, animated: Bool) {
        let navigationVC = navigationControllerFromWindow()
        navigationVC.present(viewController, animated: true, completion: nil)
    }
    
    // MARK: - Helper methods
    /**
     Check if Window variable from AppDelegate. If is not created will initialize it.
     
     - returns: Window from AppDelegate.
     */
    private func getWindow() -> UIWindow {
        if let window = (UIApplication.shared.delegate as! AppDelegate).window {
            return window
        }else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            (UIApplication.shared.delegate as! AppDelegate).window = window
            return window
        }
    }
    
    
    private func navigationControllerFromWindow() -> UINavigationController {
        if let navigationController = getWindow().rootViewController as? UINavigationController {
            return navigationController
        }
        return UINavigationController()
    }
    

}
