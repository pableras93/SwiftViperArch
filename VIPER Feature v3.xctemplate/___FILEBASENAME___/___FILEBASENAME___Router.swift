//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_productName:identifier___Router: ViperRouter {

    weak private var interface: ___VARIABLE_productName:identifier___ViewController?
    weak private var presenter: ___VARIABLE_productName:identifier___Presenter?

    /**
        Creates all Viper modules classes (Interface, Router, Presenter and Interactor)
     
        - returns: (___VARIABLE_productName:identifier___ViewController?, ___VARIABLE_productName:identifier___Router?, ___VARIABLE_productName:identifier___Presenter, ___VARIABLE_productName:identifier___Interactor)
     */
    static func createModule() -> (___VARIABLE_productName:identifier___ViewController?, ___VARIABLE_productName:identifier___Router?, ___VARIABLE_productName:identifier___Presenter, ___VARIABLE_productName:identifier___Interactor) {
        let storyboard = UIStoryboard(name: "___VARIABLE_productName:identifier___", bundle: nil)
        let viewController:___VARIABLE_productName:identifier___ViewController = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_productName:identifier___ViewControllerId") as! ___VARIABLE_productName:identifier___ViewController
        let router = ___VARIABLE_productName:identifier___Router()
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let presenter = ___VARIABLE_productName:identifier___Presenter(interface: viewController, interactor: interactor, router: router)

        
        viewController.presenter = presenter
        router.presenter = presenter

        return (viewController, router, presenter, interactor)
    }
    
}


// MARK: - ___VARIABLE_productName:identifier___PresenterToRouterProtocol
extension ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___PresenterToRouterProtocol {

}
