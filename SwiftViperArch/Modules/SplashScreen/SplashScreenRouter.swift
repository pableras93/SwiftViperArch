//
//  SplashScreenRouter.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit

class SplashScreenRouter: ViperRouter {

    weak private var interface: SplashScreenViewController?
    weak private var presenter: SplashScreenPresenter?

    /**
        Creates all Viper modules classes (Interface, Router, Presenter and Interactor)
     
        - returns: (SplashScreenViewController?, SplashScreenRouter?, SplashScreenPresenter, SplashScreenInteractor)
     */
    static func createModule() -> (SplashScreenViewController?, SplashScreenRouter?, SplashScreenPresenter, SplashScreenInteractor) {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let viewController:SplashScreenViewController = storyboard.instantiateViewController(withIdentifier: "SplashScreenViewControllerId") as! SplashScreenViewController
        let router = SplashScreenRouter()
        let interactor = SplashScreenInteractor()
        let presenter = SplashScreenPresenter(interface: viewController, interactor: interactor, router: router)

        
        viewController.presenter = presenter
        router.presenter = presenter

        return (viewController, router, presenter, interactor)
    }
    
}


// MARK: - SplashScreenPresenterToRouterProtocol
extension SplashScreenRouter: SplashScreenPresenterToRouterProtocol {
    func showHome() {
        let (homeVC, _, _, _) = HomeRouter.createModule()
        if let vc = homeVC {
            showRootViewController(vc)
        }
    }
}
