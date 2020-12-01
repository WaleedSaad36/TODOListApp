//
//  SignUpPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/21/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

protocol SignUpVMProtocol:class{
    
    func tryRegister(userName:String,email:String, password:String,age:String )
    
}




class SignUpViewModel{
    weak var view:SignUpProtocol!
    
    init(view:SignUpProtocol) {
        self.view = view
    }
    
    // MARK Validator
    
    func validateFields(email:String? ,password: String?) -> Bool{
        
        if !Validator.share().isEmptyEmail(email: email){
        self.view.presentError(messege: "please Enter an Email")
            return false
        }
        
        if !Validator.share().isValidEmail(email: email){
            self.view.presentError(messege: "Please Enter Email Valid")
            return false
        }
        
        if !Validator.share().isValidPassword(password: password){
            self.view.presentError(messege: "Please Enter Password Must be At Least 8 Characters")
            return false
        }
        return true
    }

    
    // Register Call API
    func register( userName:String?, email:String? , password: String?, age:Int?) {
        self.view.showLoader()
        
        print("problem 1 ")
        APIManager.register(name: userName ?? "" , email: email ?? "" , password: password ?? ""  , age: age ?? 0 ){ (response) in
            switch response{
            case.failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                
                print(result.token)
                UserDefaultsManager.shared().token = result.token
                self.view.switchToMainState()
            }
            
            }
        self.view.hideLoader()
    }
    
//    
//    func tryRegister(userName:String,email:String, password:String,age:String ) {
//        print("\(userName)) \(password)   \(email)  \(age)")
//        guard let ageInt = Int(age) else {return}
//        
//        if validateFields(email: email, password: password){
//            print("kkkkkkk")
//            register(userName: userName, email: email, password: password, age: ageInt)
//            
//        }
//        
//    }
    
    
}
extension SignUpViewModel:SignUpVMProtocol{
    
    func tryRegister(userName:String,email:String, password:String,age:String ) {
        print("\(userName)) \(password)   \(email)  \(age)")
        guard let ageInt = Int(age) else {return}
        
        if validateFields(email: email, password: password){
            print("kkkkkkk")
            register(userName: userName, email: email, password: password, age: ageInt)
            
        }
        
    }
    
}

