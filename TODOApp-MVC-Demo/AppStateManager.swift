//
//  AppStateManager.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 12/5/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit

protocol AppStateManagerProtocol {
    func Start(appDelegate: AppDelegateProtocol)
}

class AppStateManager{
    // MARK:- Properties
    
    var appDelegate:AppDelegateProtocol!
    var mainWindow:UIWindow? {
        return self.appDelegate?.getMainWindow()
    
    }
    
    
    
    private static let instanceShared = AppStateManager()
    // SingleTone
    class func shared () -> AppStateManager{
        
        return AppStateManager.instanceShared
    }
    
    
    enum AppState {
        case none
        case auth
        case main
    }
    var state :AppState = .none{
        willSet(newstate){
            switch newstate{
            case .auth:
                switchToAuthState()
            case .main:
                switchToMainState()
            default:
                return
            }
        }
    }
    
    
    
    func switchToMainState() {
        let todoListVC = TodoListVC.create()
        let navigationController = UINavigationController(rootViewController: todoListVC)
        todoListVC.delegate = self
        self.mainWindow?.rootViewController = navigationController
    }
    
    func switchToAuthState() {
        let signInVC = SignInVC.create()
        // ana al delegate
        signInVC.delegate = self
        
        let navigationController = UINavigationController(rootViewController: signInVC)
        self.mainWindow?.rootViewController = navigationController
    }
    
    
    
}



extension AppStateManager:AppStateManagerProtocol,AuthNavigationDelegate, MainNavigationDelegate{
    
    func showAuthState() {
        self.state = .auth
    }
    
   // AuthNavigationDelegate -5
    func showMainState() {
        self.state = .main
        
    }
    
    // AppStateManagerProtocol
    func Start(appDelegate: AppDelegateProtocol) {
        self.appDelegate = appDelegate
        // check
        
        if UserDefaultsManager.shared().token != nil {
            self.state = .main
        } else {
           self.state = .auth
        }

        
        
    }
    
    
    
    
}
