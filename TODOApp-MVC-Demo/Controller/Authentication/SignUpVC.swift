//
//  SignUpVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

protocol SignUpProtocol:class {
    
    func presentError(messege:String)
    func showLoader()
    func hideLoader()
    func switchToMainState()
}



class SignUpVC: UIViewController {

    @IBOutlet weak var signUpView: SignUpView!
    
    
    var signUpViewModel: SignUpVMProtocol!
    weak var delegate:AuthNavigationDelegate?
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailIcone(namedIcon:"emailIcon" , textField: signUpView.emailTxt)
        signUpView.setUp()
        
        
    }
    
    // MARK:- Public Methods
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signUpVC)
        
        signUpVC.signUpViewModel = SignUpViewModel(view: signUpVC)
        
        return signUpVC
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        let signIn = SignInVC.create()
        self.navigationController?.popToViewController(signIn, animated: false)
        
    }
    
    // MARK:- Public Methods
   
    
    @IBAction func registerPressBtn(_ sender: Any) {
        
        self.signUpViewModel.tryRegister(userName: signUpView.userNameTxt.text ?? "", email: signUpView.emailTxt.text ?? "", password: signUpView.passwordTxt.text ?? "" , age: signUpView.ageTxt.text ?? "")
           
        }

}

extension SignUpVC:SignUpProtocol{
    
    
    func presentError(messege:String){
        showAlert(title: "Sorry", message: messege)
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
        self.view.HideLoader()
    }
    
    func switchToMainState() {
       self.delegate?.showMainState()
    }
    
}
