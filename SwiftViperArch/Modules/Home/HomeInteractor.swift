//
//  HomeInteractor.swift
//  SwiftViperArch
//
//  Created Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import UIKit
import RxSwift

class HomeInteractor: ViperInteractor {
    var exampleRepository: ExampleRepositoryProtocol!
    private var disposeBag = DisposeBag()
    
    convenience init(exampleRepository: ExampleRepositoryProtocol) {
        self.init()
        self.exampleRepository = exampleRepository
    }
}


// MARK: - HomePresenterToInteractorProtocol
extension HomeInteractor: HomePresenterToInteractorProtocol {
    
    func getName(completion: @escaping (String) -> (), onError: @escaping (Error) -> ()) {
        
        exampleRepository.getName().subscribe(onNext: { (name) in
            completion(name)
        }, onError: { (error) in
            onError(error)
        }).disposed(by: self.disposeBag)
    }
}
