//
//  HomeRouter.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit

class HomeRouter: ViperRouter {

    weak private var interface: HomeViewController?
    weak private var presenter: HomePresenter?

    /**
        Creates all Viper modules classes (Interface, Router, Presenter and Interactor)
     
        - returns: (HomeViewController?, HomeRouter?, HomePresenter, HomeInteractor)
     */
    static func createModule() -> (HomeViewController?, HomeRouter?, HomePresenter, HomeInteractor) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerId") as! HomeViewController
        let router = HomeRouter()
        let interactor = HomeInteractor(exampleRepository: ExampleMockupServices())
        let presenter = HomePresenter(interface: viewController, interactor: interactor, router: router)

        
        viewController.presenter = presenter
        router.presenter = presenter

        return (viewController, router, presenter, interactor)
    }
    
}


// MARK: - HomePresenterToRouterProtocol
extension HomeRouter: HomePresenterToRouterProtocol {

}
