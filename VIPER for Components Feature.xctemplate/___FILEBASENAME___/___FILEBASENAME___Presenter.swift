//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift

class ___VARIABLE_productName:identifier___Presenter: ViperPresenter {

    weak private var interface: ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol?
    private var interactor: ___VARIABLE_productName:identifier___PresenterToInteractorProtocol?
    private var _subject = PublishSubject<ViperState>()

    init(interface: ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol, interactor: ___VARIABLE_productName:identifier___PresenterToInteractorProtocol?) {
        self.interface = interface
        self.interactor = interactor
    }
    

}


// MARK: - ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol
extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol {

    func interfaceIsLoaded() {

    }

}


// MARK: - ___VARIABLE_productName:identifier___PresenterExternalMethodsProtocol
extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterExternalMethodsProtocol {
    
}


// MARK: - ___VARIABLE_productName:identifier___PresenterSubscriptionProtocol
extension ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterSubscriptionProtocol {
    
    var subject: PublishSubject<ViperState> { return _subject }
}
