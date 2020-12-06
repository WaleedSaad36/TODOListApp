//
//  SignInVC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

// Auth Degate
//-1
protocol AuthNavigationDelegate:class {
    func showMainState()
}


// POP InterFace SignInVC
protocol SignInProtocol:class {
    
    func presentError(messege:String)
    func showLoader()
    func hideLoader()
    func switchToMainState()
    
    
}

class SignInVC: UIViewController {

    @IBOutlet weak var SignInView: SignInView!
    
    
    var signInViewModel: SignInVMProtocol!
    //-2
    var delegate: AuthNavigationDelegate!
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Icone Email
        emailIcone(namedIcon: "emailIcon", textField: SignInView.emailTxt)
        
        // setUpView
        self.SignInView.setUp()

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
    
    // -3
    func switchToMainState() {
        self.delegate.showMainState()
    }
    
}
