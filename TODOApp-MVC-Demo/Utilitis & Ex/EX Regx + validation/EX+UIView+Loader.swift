//
//  EX+UIView+Loader.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/6/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    func showLoader () {
        
        let activityIndicator = setUpActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func HideLoader () {
        if let activityIndicator = viewWithTag(333) {
            activityIndicator.removeFromSuperview()
        }
    }
    
    
    func setUpActivityIndicator () -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.style = .gray
        activityIndicator.tag = 333
        
        return activityIndicator
    }
    
    
}
