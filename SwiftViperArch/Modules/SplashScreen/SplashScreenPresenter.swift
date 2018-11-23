//
//  SplashScreenPresenter.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit

class SplashScreenPresenter: ViperPresenter {

    weak private var interface: SplashScreenPresenterToInterfaceProtocol?
    private var interactor: SplashScreenPresenterToInteractorProtocol?
    private let router: SplashScreenPresenterToRouterProtocol
    
    private var timer: Timer?

    init(interface: SplashScreenPresenterToInterfaceProtocol, interactor: SplashScreenPresenterToInteractorProtocol?, router: SplashScreenPresenterToRouterProtocol) {
        self.interface = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: false)
    }
    
    @objc private func updateTime() {
        timer?.invalidate()
        router.showHome()
    }

}


// MARK: - SplashScreenInterfaceToPresenterProtocol
extension SplashScreenPresenter: SplashScreenInterfaceToPresenterProtocol {

    func interfaceIsLoaded() {
        startTimer()
    }

}
