//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit



class ___VARIABLE_productName:identifier___ViewController: ViperViewController {

    var presenter: ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol?

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

// MARK: - ___VARIABLE_productName:identifier___InterfaceProtocol
extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___InterfaceProtocol {

    func updateUI() {
        //presenter?.addComponentSubscription(#Subscription#)
    }
    
    func updateStrings() {
        
    }
    
    func checkConstraints() {
        
    }
    
}


//  MARK: - ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol
extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___PresenterToInterfaceProtocol {
    
    // Recieve States from presenter in order to update the interface.
    func render(_ state: ViperState) {
        switch state {
        default:
            break
        }
    }
    
}



