//
//  SwiftViperArchTests.swift
//  SwiftViperArchTests
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftViperArch

class SwiftViperArchTests: XCTestCase {

    
    var homePresenter: HomePresenter!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerId") as! HomeViewController
        let router = HomeRouter()
        let interactor = HomeInteractor(exampleRepository: ExampleMockupServices())
        self.homePresenter = HomePresenter(interface: viewController, interactor: interactor, router: router)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSumaExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let suma = self.homePresenter.suma(10, 10)
        XCTAssertEqual(suma,20,"Hubo un error al ejecutar el test.")
    }

}
