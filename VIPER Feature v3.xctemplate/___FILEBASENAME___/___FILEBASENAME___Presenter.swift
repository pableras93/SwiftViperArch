//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___VARIABLE_productName:identifier___Presenter: ViperPresenter {

    weak private var interface: ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol?
    private var interactor: ___VARIABLE_productName:identifier___PresenterToInteractorProtocol?
    private let router: ___VARIABLE_productName:identifier___PresenterToRouterProtocol

    init(interface: ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol, interactor: ___VARIABLE_productName:identifier___PresenterToInteractorProtocol?, router: ___VARIABLE_productName:identifier___PresenterToRouterProtocol) {
        self.interface = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    override func stateFromComponent(_ state: ViperState) {
        super.stateFromComponent(state)
    }

}


// MARK: - ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol
extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol {

    func interfaceIsLoaded() {

    }

}
