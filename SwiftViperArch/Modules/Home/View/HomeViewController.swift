//
//  HomeViewController.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit



class HomeViewController: ViperViewController {

    var presenter: HomeInterfaceToPresenterProtocol?

    @IBOutlet weak var scrollableAreaView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        updateStrings()
        checkConstraints()
        presenter?.interfaceIsLoaded()
        presenter?.getName()
    }

}

// MARK: - HomeInterfaceProtocol
extension HomeViewController: HomeInterfaceProtocol {

    func updateUI() {
        //presenter?.addComponentSubscription(#Subscription#)
    }
    
    func updateStrings() {
        
    }
    
    func checkConstraints() {
        
    }
    
}


//  MARK: - HomePresenterToInterfaceProtocol
extension HomeViewController: HomePresenterToInterfaceProtocol {
    
    // Recieve States from presenter in order to update the interface.
    func render(_ state: ViperStateProtocol) {
        switch state {
        case is HomeFirstState:
            nameLabel.text = (state as! HomeFirstState).name
        default:
            break
        }
    }
    
}



