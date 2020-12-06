//
//  SignUpView.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//
import Foundation
import UIKit

class SignUpView: UIView {
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    // OutLets >> textFields
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var RegisterBtn: UIButton!
    
    func setUp(){
        
        setUpTextField(TextField: userNameTxt, placeholder: "Please Enter Username", isSecure: false, isPhone: false)
        
        setUpTextField(TextField: emailTxt, placeholder: "Please Enter Email", isSecure: false, isPhone: false)
        
        setUpTextField(TextField: passwordTxt, placeholder: "Please Enter Password", isSecure: true, isPhone: false)
        
        setUpTextField(TextField: ageTxt , placeholder: "Please Enter Age +18 ", isSecure: false, isPhone: false)
        
        setupBackground()
        
        setUpButton(Button: RegisterBtn, setTitle: "Register", Textcolor: .white, backgroundColor: .red)
        
        setUpLabel(label: userNameLbl, text: "Username")
        setUpLabel(label: emailLbl, text: "Email")
        setUpLabel(label: passwordLbl, text: "Password")
        setUpLabel(label: ageLbl, text: "Age")
    }
    
}


extension SignUpView{
   private func setUpTextField(TextField:UITextField,placeholder:String, isSecure:Bool = false,isPhone:Bool = false ){
    
        TextField.backgroundColor = .white
        TextField.placeholder = placeholder
        TextField.isSecureTextEntry = isSecure
        if isPhone{
            TextField.keyboardType = .asciiCapableNumberPad
        }
    }
    
   private func setupBackground(){
        self.imageBackground.image = UIImage(named: "background 2")
    }
    
    private func setUpButton(Button:UIButton,setTitle:String,Textcolor:UIColor,backgroundColor:UIColor ){
        
        Button.backgroundColor = .black
        Button.tintColor = Textcolor
        Button.setTitle(setTitle, for: .normal)
        Button.backgroundColor = backgroundColor
        Button.layer.cornerRadius = Button.frame.height / 2
    }
    
    
    private func setUpLabel(label:UILabel,text:String){
        
        label.textColor = .blue
        label.text = text
        label.font = UIFont(name: "Futura Medium ", size: 30)
        
    }
}
