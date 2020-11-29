//
//  File.swift
//  MediaFinder
//
//  Created by IDE Academy on 6/8/20.
//  Copyright © 2020 IDE Academy. All rights reserved.
//
import Foundation
import UIKit

extension UIViewController {
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    func isValidPassword(passwordString: String) -> Bool {
        
        var returnValue = true
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = passwordString as NSString
            let results = regex.matches(in: passwordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
        
    }
    
    
    
    
}
