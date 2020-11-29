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

    @IBOutlet var SignUpView: SignUpView!
    
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    
    
    var presenter: SignUpPresenter!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var lbl5: UILabel!
    
    @IBOutlet weak var userNameTxt: UITextField!
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    @IBOutlet weak var ageTxt: UITextField!
    
    
    
    
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailIcone(namedIcon:"emailIcon" , textField: emailTxt)
        SignUpView.setUp()
        
        
    }
    
    // MARK:- Public Methods
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.authentication, identifier: ViewControllers.signUpVC)
        
        signUpVC.presenter = SignUpPresenter(view: signUpVC)
        
        return signUpVC
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        let signIn = SignInVC.create()
        self.navigationController?.popToViewController(signIn, animated: false)
        
    }
    
    // MARK:- Public Methods
   
    
    @IBAction func registerPressBtn(_ sender: Any) {
        
        self.presenter.tryRegister(userName: userNameTxt.text ?? "", email: emailTxt.text ?? "", password: passwordTxt.text ?? "" , age: ageTxt.text ?? "")
           
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
        let todoListVC = TodoListVC.create()
        let navigationController = UINavigationController(rootViewController: todoListVC)
        AppDelegate.shared().window?.rootViewController = navigationController
    }
    
    
    
    
}
