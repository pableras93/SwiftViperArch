//
//  ViperPresenter.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import RxSwift


class ViperPresenter: NSObject {
    
    private let disposeBag = DisposeBag()
    
    internal func stateFromComponent(_ state: ViperStateProtocol) {
        //GeneralManager.customPrint(state)
    }
    
    deinit {
        //GeneralManager.customPrint("")
    }
    
    
}

// MARK: - ViperInterfaceToPresenterComponentsSubscriptionsProtocol
extension ViperPresenter: ViperComponentsSubscriptionsProtocol {
    
    
    func addComponentSubscription(_ subscription: PublishSubject<ViperStateProtocol>) {
        //if let _ = getComponentSubscription(subscription) { return }
        
        let _ = subscription.asObserver().subscribe(onNext: { (state) in
            self.stateFromComponent(state)
        })
            .disposed(by: disposeBag)
        
        //componentsSubscriptions.append(ComponentSubscription(subject: subscription/*, disposable: disposable*/))
    }
    
    func addComponentsSubscriptions(_ subscriptions: [PublishSubject<ViperStateProtocol>]) {
        for subscription in subscriptions {
            addComponentSubscription(subscription)
        }
    }
    
    //    func removeComponentSubscription(_ subscription: PublishSubject<ViperState>) {
    //        guard let componentSubscription = getComponentSubscription(subscription) else { return }
    //        componentSubscription.subject.dispose()
    //
    //        if let index = componentsSubscriptions.index(where: { $0.subject === componentSubscription.subject }) {
    //            componentsSubscriptions.remove(at: index)
    //        }
    //    }
    
    //    func removeComponentsSubscriptions(_ subscriptions: [PublishSubject<ViperState>]) {
    //        for subscription in subscriptions {
    //            removeComponentSubscription(subscription)
    //        }
    //    }
    
    //    func removeAllComponentsSubscriptions() {
    //        for componentsSubscription in componentsSubscriptions {
    //            removeComponentSubscription(componentsSubscription.subject)
    //        }
    //    }
    
    
    // MARK: Helper methods
    //    private func getComponentSubscription(_ subscription: PublishSubject<ViperState>) -> ComponentSubscription? {
    //
    //        for existingComponentSubscription in componentsSubscriptions {
    //            if existingComponentSubscription.subject === subscription {
    //                return existingComponentSubscription
    //            }
    //        }
    //        return nil
    //    }
    
}
