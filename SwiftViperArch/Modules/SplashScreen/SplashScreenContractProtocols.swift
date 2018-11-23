//
//  SplashScreenContractProtocols.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

// MARK: - Router & Presenter Show Screen methods
/**
    This protocol will declare all methods for showing screen purposes.
    Can be implemented in Router and / or Presenter classes
 */
protocol SplashScreenShowScreenProtocol: class {
    
}

//MARK: - Presenter -> Router
/**
 This protocol will declare all methods connecting the Presenter with the Router.
 */
protocol SplashScreenPresenterToRouterProtocol: ViperPresenterToRouterProtocol, SplashScreenShowScreenProtocol {
    
    func showHome()
}


//MARK: - Presenter -> Interactor
/**
 This protocol will declare all methods connecting the Presenter with the Interactor.
 */
protocol SplashScreenPresenterToInteractorProtocol: ViperPresenterToInteractorProtocol {

}


//MARK: - Interface -> Presenter
/**
 This protocol will declare all methods connecting the Interface with the Presenter.
 */
protocol SplashScreenInterfaceToPresenterProtocol: ViperInterfaceToPresenterProtocol, SplashScreenShowScreenProtocol, ViperComponentsSubscriptionsProtocol {

}

//MARK: - Presenter -> Interface
/**
 This protocol will declare all methods connecting the Presenter with the Interface.
 */
protocol SplashScreenPresenterToInterfaceProtocol: ViperPresenterToInterfaceProtocol {

}


//MARK: - Interface
/**
 This protocol will declare all methods relative only with the Interface.
 */
protocol SplashScreenInterfaceProtocol: ViperInterfaceProtocol {

}

//MARK: - State
/**
 This protocol will declare all differentes States the Presenter will send to the Interface.
 */
protocol SplashScreenState: ViperStateProtocol {

}
