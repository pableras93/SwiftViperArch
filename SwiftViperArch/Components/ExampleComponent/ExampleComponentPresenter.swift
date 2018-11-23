//
//  ExampleComponentPresenter.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit
import RxSwift

class ExampleComponentPresenter: ViperPresenter {

    weak private var interface: ExampleComponentPresenterToInterfaceProtocol?
    private var interactor: ExampleComponentPresenterToInteractorProtocol?
    private var _subject = PublishSubject<ViperStateProtocol>()

    init(interface: ExampleComponentPresenterToInterfaceProtocol, interactor: ExampleComponentPresenterToInteractorProtocol?) {
        self.interface = interface
        self.interactor = interactor
    }
    

}


// MARK: - ExampleComponentInterfaceToPresenterProtocol
extension ExampleComponentPresenter: ExampleComponentInterfaceToPresenterProtocol {

    func interfaceIsLoaded() {

    }

}


// MARK: - ExampleComponentPresenterExternalMethodsProtocol
extension ExampleComponentPresenter: ExampleComponentPresenterExternalMethodsProtocol {
    
}


// MARK: - ExampleComponentPresenterSubscriptionProtocol
extension ExampleComponentPresenter: ExampleComponentPresenterSubscriptionProtocol {
    
    var subject: PublishSubject<ViperStateProtocol> { return _subject }
}
