//
//  EX+VC.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 10/31/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController  {
    func alertOk(title: String , message: String , style :UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
        
    }
    
}
