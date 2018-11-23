//
//  ExampleService.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import RxSwift

struct ExampleMockupServices: ExampleRepositoryProtocol {
    
    func getNames() -> Observable<[String]> {
        let result = Observable<[String]>.create { (observer) -> Disposable in
            observer.onNext(["Claudia", "Paula", "Mark", "Alfonso", "Cristina"])
            observer.onCompleted()
            return Disposables.create()
        }
        
        return result
    }
}
