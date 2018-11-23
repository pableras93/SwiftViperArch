//
//  ExampleComponentContractProtocols.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation


//MARK: - Presenter -> Interactor
/**
 This protocol will declare all methods connecting the Presenter with the Interactor.
 */
protocol ExampleComponentPresenterToInteractorProtocol: ViperPresenterToInteractorProtocol {

}


//MARK: - Interface -> Presenter
/**
 This protocol will declare all methods connecting the Interface with the Presenter.
 */
protocol ExampleComponentInterfaceToPresenterProtocol: ViperInterfaceToPresenterProtocol, ViperComponentsSubscriptionsProtocol {

}

//MARK: - Presenter -> Interface
/**
 This protocol will declare all methods connecting the Presenter with the Interface.
 */
protocol ExampleComponentPresenterToInterfaceProtocol: ViperPresenterToInterfaceProtocol {

}

//MARK: - Presenter external methods
/**
 This protocol will be used to declare public methods to connect with other interfaces .
 */
protocol ExampleComponentPresenterExternalMethodsProtocol: ViperPresenterExternalMethodsProtocol {
    
}

//MARK: - Presenter subscription methods
/**
 This protocol will be used to declare a public subject to allow other controllers to subscribe this controller's events.
 */
protocol ExampleComponentPresenterSubscriptionProtocol: ViperPresenterPublicSubscriptionProtocol {
    
}


//MARK: - Interface
/**
 This protocol will declare all methods relative only with the Interface.
 */
protocol ExampleComponentInterfaceProtocol: ViperInterfaceProtocol {

}

//MARK: - State
/**
 This protocol will declare all differentes States the Presenter will send to the Interface.
 */
protocol ExampleComponentState: ViperStateProtocol {

}
