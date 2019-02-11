//
//  MirrorExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 11/02/2019.
//  Copyright © 2019 Pablo Barcos. All rights reserved.
//

import Foundation


extension Mirror {
    static func reflectProperties<T>(
        of target: Any,
        matchingType type: T.Type = T.self,
        using closure: (T) -> Void
        ) {
        let mirror = Mirror(reflecting: target)
        
        for child in mirror.children {
            (child.value as? T).map(closure)
        }
    }
}


/*
 Example:
 
 class FavoritesStorage {
    var name: String?
    var secondName: String?
 
    init(name: String?, secondName: String?) {
        self.name = name
        self.secondName = secondName
    }
 }
 
 class CredentialsStorage {
    var uno: String?
    var dos: String?
 
    init(uno: String?, dos: String?) {
        self.uno = uno
        self.dos = dos
    }
 }
 
 class UserSession {
    var credentials: CredentialsStorage
    var favorites: FavoritesStorage
 
    init(credentials: CredentialsStorage, favorites: FavoritesStorage) {
        self.credentials = credentials
        self.favorites = favorites
    }
 }
 
 protocol Resettable {
    func reset()
 }
 
 extension CredentialsStorage: Resettable {
    func reset() {
        self.uno = nil
        self.dos = nil
    }
 }
 
 extension FavoritesStorage: Resettable {
    func reset() {
        self.name = nil
        self.secondName = nil
    }
 }
 
 
 extension UserSession {
    func logOut() {
 
        Mirror.reflectProperties(of: self) {
            (child: Resettable) in
            child.reset()
        }
    }
 }*/
