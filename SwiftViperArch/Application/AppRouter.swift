//
//  AppRouter.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 Class that contains all special ViperRouter methods to use in the application.
 */
class AppRouter: ViperRouter {
    
    // MARK: - Public methods
    func showSplashScreen() {
        let (splashVC, _, _, _) = SplashScreenRouter.createModule()
        if let splashVC = splashVC {
            showRootViewController(splashVC)
        }
    }
    
}
