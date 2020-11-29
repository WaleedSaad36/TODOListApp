//
//  Validator.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/26/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

class Validator {
    
    // MARK SingleTone
    
    private static let shareInstance = Validator()
    
    
    class func share() -> Validator{
        return Validator.shareInstance
    }
    
    
    func isEmptyEmail(email: String?) -> Bool {
        guard let email = email?.trimmed, !email.isEmpty else {
            return false
        }
        
       return true
    }
    
    
    func isValidEmail(email: String?) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if !pred.evaluate(with: email) {
            return false
        }
        return true
    }
    
    func isValidPassword(password: String?) -> Bool {
        guard let password = password, !password.isEmpty else {
            return false
        }
        return true
    }
    
    
}
