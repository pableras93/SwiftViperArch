//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Router & Presenter Show Screen methods
/**
    This protocol will declare all methods for showing screen purposes.
    Can be implemented in Router and / or Presenter classes
 */
protocol ___VARIABLE_productName:identifier___ShowScreenProtocol: class {

}

//MARK: - Presenter -> Router
/**
 This protocol will declare all methods connecting the Presenter with the Router.
 */
protocol ___VARIABLE_productName:identifier___PresenterToRouterProtocol: ViperPresenterToRouterProtocol, ___VARIABLE_productName:identifier___ShowScreenProtocol {

}


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
protocol ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol: ViperInterfaceToPresenterProtocol, ___VARIABLE_productName:identifier___ShowScreenProtocol, ViperComponentsSubscriptionsProtocol {

}

//MARK: - Presenter -> Interface
/**
 This protocol will declare all methods connecting the Presenter with the Interface.
 */
protocol ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol: ViperPresenterToInterfaceProtocol {

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
