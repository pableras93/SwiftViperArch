//
//  ExampleComponentViewController.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit
import RxSwift


class ExampleComponentView: BaseComponentView {

    lazy private var presenter: ExampleComponentInterfaceToPresenterProtocol & ExampleComponentPresenterExternalMethodsProtocol & ExampleComponentPresenterSubscriptionProtocol = {
        [unowned self] in
        ExampleComponentPresenter(interface: self, interactor: nil)
    }()

    
    @IBOutlet weak var scrollableAreaView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    
    var methods: ExampleComponentPresenterExternalMethodsProtocol { return presenter }
    var subscription: PublishSubject<ViperStateProtocol> { return presenter.subject }

    override func componentViewDidLoad() {
        super.componentViewDidLoad()

        updateUI()
        updateStrings()
        checkConstraints()
        presenter.interfaceIsLoaded()
    }

}

// MARK: - ExampleComponentInterfaceProtocol
extension ExampleComponentView: ExampleComponentInterfaceProtocol {

    func updateUI() {
        
    }
    
    func updateStrings() {
        
    }
    
    func checkConstraints() {
        
    }
    
}


//  MARK: - ExampleComponentPresenterToInterfaceProtocol
extension ExampleComponentView: ExampleComponentPresenterToInterfaceProtocol {
    
    // Recieve States from presenter in order to update the interface.
    func render(_ state: ViperStateProtocol) {
        switch state {
        default:
            break
        }
    }
    
}



