//
//  EX+TextFields.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/5/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
extension UIViewController {
    
    
    func emailIcone(namedIcon:String, textField:UITextField ){
        
        let emailImage = UIImage(named:namedIcon)
        addLeftImageTo(txtField: textField, andImage: emailImage!)
        
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    
}
