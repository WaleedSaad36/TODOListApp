//
//  Constants.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation


// Storyboards
struct Storyboards {
    static let authentication = "Authentication"
    static let main = "Main"
}

// View Controllers
struct ViewControllers {
    static let signUpVC = "SignUpVC"
    static let signInVC = "SignInVC"
    static let todoListVC = "TodoListVC"
    static let profileVC = "ProfileVC"
}

// nib file
struct Cells {
    static let todoCell = "TodoCell"
}

// Urls
struct URLs {
    
    // user --> login - register - updateProfile - image
    
    static let base = "https://api-nodejs-todolist.herokuapp.com"
    static let login = "/user/login"
    static let register = "/user/register"
    static let updateProfile = "/user/me"
    static let getLoginUser = "/user/me"
    static let uploadImage = "/user/me/avatar"
    static let getImage = "/user"
    
    static let logOut = "/user/logout"
    
    // Task --> post - get - update - delete
    
    static let addNewTask = "/task"
    static let getAllTask = "/task"
    
    static let updateTaskById = "/task/5ddcd1566b55da0017597239"
    
    static let deleteTaskById = "/task/5ddcd1566b55da0017597239"
    
    
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let authorization = "Authorization"
}

// Parameters Keys
struct ParameterKeys {
    static let email = "email"
    static let password = "password"
    static let description = "description"
    static let completed = "completed"
    static let name = "name"
    static let age = "age"
    static let id = "_id"
}



struct ParameterRegister {
    static let name = "name"
    static let email = "email"
    static let password = "password"
    static let age = "age"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
}
