//
//  AuthService.swift
//  Slakish
//
//  Created by BootCamp on 11/12/17.
//  Copyright © 2017 Dmitrii. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    
    fileprivate var _id = ""
    fileprivate var _email = ""
    fileprivate var _name = ""
    fileprivate var _isLoggedIn = false
    fileprivate var _alias = ""
    
    var isLoggedIn: Bool {
        get {
            return _isLoggedIn
        }
        set {
            _isLoggedIn = newValue
        }
    }
    
    var id: String {
        get {
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    var email: String {
        get {
            return _email
        }
        set {
            _email = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var alias: String {
        get {
            return _alias
        }
        set {
            _alias = newValue
        }
    }
    

}
