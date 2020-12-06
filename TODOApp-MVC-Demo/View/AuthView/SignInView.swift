//
//  SignInView.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class SignInView: UIView {

    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var RegisterBtn: UIButton!
    
    
    func setUp(){
        setUpBackground()
        setUpTextField(textField: emailTxt, placeHolder: "Please Enter Email", isSecure: false)
        setUpTextField(textField: passwordTxt, placeHolder: "Please Enter Password", isSecure: true)
        
        setUpButton(Button: LoginBtn, setTitle: "Login", Textcolor: .white, backgroundColor: .blue)
        
        setUpButton(Button: RegisterBtn, setTitle: "Register", Textcolor: .white, backgroundColor: .red)
        
        setUpLabel(Label: titleLabel)
        
    }
}
extension SignInView{
    
    private func setUpTextField(textField:UITextField, placeHolder:String,isSecure:Bool) {
        
        textField.backgroundColor = .white
        textField.placeholder = placeHolder
        textField.font = UIFont(name: emailTxt.font!.fontName, size:20)
        textField.isSecureTextEntry = isSecure
        
    }
    
    private func setUpButton(Button:UIButton,setTitle:String,Textcolor:UIColor,backgroundColor:UIColor ){
        
        Button.backgroundColor = .black
        Button.tintColor = Textcolor
        Button.setTitle(setTitle, for: .normal)
        Button.backgroundColor = backgroundColor
        Button.layer.cornerRadius = Button.frame.height / 2
        
    }
    
    private func setUpBackground(){
        
        self.Background.image = UIImage(named: "background 2")
        
    }
    
    
    private func setUpLabel(Label:UILabel){
        Label.textColor = .black
        
    }
    
}
