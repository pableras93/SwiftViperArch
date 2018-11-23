//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation


//MARK: - Presenter -> Interactor
/**
 This protocol will declare all methods connecting the Presenter with the Interactor.
 */
protocol ___VARIABLE_productName:identifier___PresenterToInteractorProtocol: ViperPresenterToInteractorProtocol {

}


//MARK: - Interface -> Presenter
/**
 This protocol will declare all methods connecting the Interface with the Presenter.
 */
protocol ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol: ViperInterfaceToPresenterProtocol, ViperComponentsSubscriptionsProtocol {

}

//MARK: - Presenter -> Interface
/**
 This protocol will declare all methods connecting the Presenter with the Interface.
 */
protocol ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol: ViperPresenterToInterfaceProtocol {

}

//MARK: - Presenter external methods
/**
 This protocol will be used to declare public methods to connect with other interfaces .
 */
protocol ___VARIABLE_productName:identifier___PresenterExternalMethodsProtocol: ViperPresenterExternalMethodsProtocol {
    
}

//MARK: - Presenter subscription methods
/**
 This protocol will be used to declare a public subject to allow other controllers to subscribe this controller's events.
 */
protocol ___VARIABLE_productName:identifier___PresenterSubscriptionProtocol: ViperPresenterPublicSubscriptionProtocol {
    
}


//MARK: - Interface
/**
 This protocol will declare all methods relative only with the Interface.
 */
protocol ___VARIABLE_productName:identifier___InterfaceProtocol: ViperInterfaceProtocol {

}

//MARK: - State
/**
 This protocol will declare all differentes States the Presenter will send to the Interface.
 */
protocol ___VARIABLE_productName:identifier___State: ViperState {

}
