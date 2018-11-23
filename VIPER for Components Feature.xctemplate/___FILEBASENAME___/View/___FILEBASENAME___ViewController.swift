//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift


class ___VARIABLE_productName:identifier___ViewController: BaseComponentView {

    lazy private var presenter: ___VARIABLE_productName:identifier___InterfaceToPresenterProtocol & ___VARIABLE_productName:identifier___PresenterExternalMethodsProtocol & ___VARIABLE_productName:identifier___PresenterSubscriptionProtocol = {
        [unowned self] in
        ___VARIABLE_productName:identifier___Presenter(interface: self, interactor: nil)
    }()

    
    @IBOutlet weak var scrollableAreaView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    
    var methods: ___VARIABLE_productName:identifier___PresenterExternalMethodsProtocol { return presenter }
    var subscription: PublishSubject<ViperState> { return presenter.subject }

    override func componentViewDidLoad() {
        super.componentViewDidLoad()

        updateUI()
        updateStrings()
        checkConstraints()
        presenter?.interfaceIsLoaded()
    }

}

// MARK: - ___VARIABLE_productName:identifier___InterfaceProtocol
extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___InterfaceProtocol {

    func updateUI() {
        
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



