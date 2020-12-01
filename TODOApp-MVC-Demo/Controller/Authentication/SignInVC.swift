//
//  SignInVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

// POP InterFace SignInVC
protocol SignInProtocol:class {
    
    func presentError(messege:String)
    
    func showLoader()
    
    func hideLoader()
    
    
    func switchToMainState()
    
    
}

class SignInVC: UIViewController {

    @IBOutlet var SignInView: SignInView!
    
    
    var signInViewModel: SignInVMProtocol!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Icone Email
        emailIcone(namedIcon: "emailIcon", textField: SignInView.emailTxt)
        
        // setUpView
        SignInView.setUp()

    }
    
    
    // MARK:- Public Methods
    class func create() -> SignInVC {
        let signInVC: SignInVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signInVC)
        signInVC.signInViewModel = SignInViewModel(view: signInVC) 
        return signInVC
        
    }
    
    
    @IBAction func LoginBtn(_ sender: Any) {
        signInViewModel.tryLogin(email: SignInView.emailTxt.text ?? "", password: SignInView.passwordTxt.text ?? "" )
    }
    
    
    @IBAction func RegisterBtn(_ sender: Any) {
       let signUpVC = SignUpVC.create()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}


// SignInVC Conform ->>> SignInProtocol
extension SignInVC :SignInProtocol{
    
    
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
        let todoListVC = TodoListVC.create()
        let navigationController = UINavigationController(rootViewController: todoListVC)
        AppDelegate.shared().window?.rootViewController = navigationController
    }
    
}
