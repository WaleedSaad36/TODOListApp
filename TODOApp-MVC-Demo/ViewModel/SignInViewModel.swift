//
//  SignInPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/21/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
protocol SignInVMProtocol:class{
    
    func tryLogin(email:String, password:String)

}


class SignInViewModel{
    
    
   weak var view:SignInProtocol!
    
    init(view:SignInProtocol) {
        self.view = view
    }
    
    //Validation :- SingleTone
    
    func validateFields(email:String? ,password: String?) -> Bool{
        
        if !Validator.share().isEmptyEmail(email: email){
            self.view.presentError(messege: "Please Enter an Email")
            return false
        }
        
        if !Validator.share().isValidEmail(email: email){
            self.view.presentError(messege: "Please Enter Email Valid")
            return false
        }
        
        if !Validator.share().isValidPassword(password: password){
            self.view.presentError(messege: "Please Enter Password Must be At Least 8 Characters ")
            return false
        }
        
        return true
    }
    
    //____  login SignInVC And API
    
    func login( email:String? , password: String?) {
        self.view.showLoader()
        
        APIManager.login(with: email! , password: password! ) { (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                print(result.token)
                UserDefaultsManager.shared().token = result.token
                self.view.switchToMainState()
            }
            
         }
        self.view.hideLoader()
        
        }
    
    
//    func tryLogin(email:String, password:String) {
//        if validateFields(email: email, password: password){
//            login(email: email, password: password)
//        }
//
//    }
//
    
}
extension SignInViewModel:SignInVMProtocol{
    
    func tryLogin(email:String, password:String) {
        if validateFields(email: email, password: password){
            login(email: email, password: password)
        }
        
    }
    
}
