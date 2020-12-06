//
//  AppDelegate.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit


protocol AppDelegateProtocol {
    func getMainWindow() -> UIWindow?
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppStateManager.shared().Start(appDelegate: self)
        
        return true
    }

}

extension AppDelegate:AppDelegateProtocol{
    func getMainWindow() -> UIWindow? {
        return self.window
    }
}








extension AppDelegate {
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
   
    
}
