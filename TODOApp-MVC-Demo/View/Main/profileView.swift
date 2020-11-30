//
//  ProfileView.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class profileView: UIView {

    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var charLabel: UILabel!
    
    @IBOutlet weak var EditBtn: UIButton!
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userNameTxt: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTxt: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var ageTxt: UILabel!
    
    @IBOutlet weak var LogOutBtn: UIButton!
    
    
    func SetUp() {
        setUpImage()
        setUpLabel(label: userNameLbl, text: "userName")
        setUpLabel(label: emailLbl, text: "Email")
        setUpLabel(label: ageLbl, text: "Age")
        setUpLabel(label: userNameTxt, text: "")
        setUpLabel(label: emailTxt, text: "")
        setUpLabel(label: ageTxt, text: "")
        setUpLabel(label: charLabel, text: "")
        
        setUpButton(Button: LogOutBtn, setTitle: "LogOut", Textcolor: .white, backgroundColor: .black)
        
        setUpButton(Button: EditBtn, setTitle: "Edit", Textcolor: .blue, backgroundColor: .white)
        
    }
    
    
    
    
}
extension profileView{
    
private func setUpButton(Button:UIButton,setTitle:String,Textcolor:UIColor,backgroundColor:UIColor ){
    
    Button.backgroundColor = .black
    Button.tintColor = Textcolor
    Button.setTitle(setTitle, for: .normal)
    //Button.font = UIFont?(name: "Marker Felt Thin", size: 40)
    Button.backgroundColor = backgroundColor
    Button.layer.cornerRadius = Button.frame.height / 2
    
}
    
   private func setUpLabel(label:UILabel , text:String ) {
        label.text = text
        label.textColor = .blue
        label.font = UIFont.init(name: "Futura Medium", size: 22)
    }
    
    
    private func setUpImage(){
        self.imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
    }
    
    
    
    
}
