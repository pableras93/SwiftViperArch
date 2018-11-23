//
//  ViperContractProtocols.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import RxSwift

//MARK: - Presenter -> Router
/**
 This protocol will declare all methods connecting the Presenter with the Router.
 */
protocol ViperPresenterToRouterProtocol: class {
    
}


//MARK: - Interface -> Presenter
/**
 This protocol will declare all methods connecting the Interface with the Presenter.
 */
protocol ViperInterfaceToPresenterProtocol: class {
    
    /**
     Indicates the presenter when the Interface is completely loaded.
     */
    func interfaceIsLoaded()
}


//MARK: - Presenter -> Interactor
/**
 This protocol will declare all methods connecting the Presenter with the Interactor.
 */
protocol ViperPresenterToInteractorProtocol: class {
    
}

/**
 This protocol will be used to declare public methods to connect with other interfaces .
 */
protocol ViperPresenterExternalMethodsProtocol {
    
}

/**
 This protocol will be used to declare a public subject to allow other controllers to subscribe this controller's events.
 */
protocol ViperPresenterPublicSubscriptionProtocol {
    var subject: PublishSubject<ViperStateProtocol> { get }
}

/**
 This protocol will declare all methods connecting the Interface with the Presenter for components subscriptions.
 */
protocol ViperComponentsSubscriptionsProtocol {
    
    /**
     Adds the component subscription into the presenter
     
     - parameter subscription: subscription to the component.
     */
    func addComponentSubscription(_ subscription: PublishSubject<ViperStateProtocol>)
    
    /**
     Adds components subscriptions from the given array into the presenter
     
     - parameter subscriptions: subscription to the component.
     */
    func addComponentsSubscriptions(_ subscriptions: [PublishSubject<ViperStateProtocol>])
    
    /**
     Removes the component subscription from the presenter
     
     - parameter subscription: subscription to the component.
     */
    //func removeComponentSubscription(_ subscription: PublishSubject<ViperState>)
    
    /**
     Removes components subscriptions from the given array from the presenter
     
     - parameter subscription: subscription to the component.
     */
    //func removeComponentsSubscriptions(_ subscriptions: [PublishSubject<ViperState>])
    
    
    /**
     Removes all existing components subscriptions in the presenter
     */
    //func removeAllComponentsSubscriptions()
}


//MARK: - Presenter -> Interface
/**
 This protocol will declare all methods connecting the Presenter with the Interface.
 */
protocol ViperPresenterToInterfaceProtocol: class {
    
    /**
     Recieve States from presenter in order to update the interface.
     
     - parameter state: Value in ViperState that indicates how interface must be updated.
     
     */
    func render(_ state: ViperStateProtocol)
}


// MARK: - Interface
/**
 This protocol will declare all methods relative only with the Interface.
 */
protocol ViperInterfaceProtocol: class {
    
    /**
     Update all UI relative (colors, fonts, etc.).
     */
    func updateUI()
    
    /**
     Update all strings files used
     */
    func updateStrings()
    
    /**
     Checking interface constraints values.
     */
    func checkConstraints()
}
