//
//  ExampleRepositoryProtocol.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleRepositoryProtocol {
    
    /**
     Get value 1.
     
     - returns: Observable of type String.
     */
    func getNames() -> Observable<[String]>
    
    
}
