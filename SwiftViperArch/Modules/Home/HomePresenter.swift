//
//  HomePresenter.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit

class HomePresenter: ViperPresenter {

    weak private var interface: HomePresenterToInterfaceProtocol?
    private var interactor: HomePresenterToInteractorProtocol?
    private let router: HomePresenterToRouterProtocol

    init(interface: HomePresenterToInterfaceProtocol, interactor: HomePresenterToInteractorProtocol?, router: HomePresenterToRouterProtocol) {
        self.interface = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    override func stateFromComponent(_ state: ViperStateProtocol) {
        super.stateFromComponent(state)
    }
    
    func suma(_ a:Int, _ b:Int) -> Int {
        return a + b
    }

}


// MARK: - HomeInterfaceToPresenterProtocol
extension HomePresenter: HomeInterfaceToPresenterProtocol {

    func interfaceIsLoaded() {
        
    }
    
    func getName() {
        
        interactor?.getName( completion: { (name) in
            self.interface?.render(HomeFirstState(name: name))
        }, onError: { (error) in
            
        })
    }

}
