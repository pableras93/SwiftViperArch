//
//  SplashScreenViewController.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit



class SplashScreenViewController: ViperViewController {

    var presenter: SplashScreenInterfaceToPresenterProtocol?

    @IBOutlet weak var scrollableAreaView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        updateStrings()
        checkConstraints()
        presenter?.interfaceIsLoaded()
    }

}

// MARK: - SplashScreenInterfaceProtocol
extension SplashScreenViewController: SplashScreenInterfaceProtocol {

    func updateUI() {
        //presenter?.addComponentSubscription(#Subscription#)
    }
    
    func updateStrings() {
        
    }
    
    func checkConstraints() {
        
    }
    
}


//  MARK: - SplashScreenPresenterToInterfaceProtocol
extension SplashScreenViewController: SplashScreenPresenterToInterfaceProtocol {
    
    // Recieve States from presenter in order to update the interface.
    func render(_ state: ViperStateProtocol) {
        switch state {
        default:
            break
        }
    }
    
}



