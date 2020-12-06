//
//  ProfilePresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//


import Foundation


protocol ProfileVMProtocol:class{
    
    func loadAllData ()
    func uploadImage(data: Data)
    func logOut()
    func getImageAPI(id:String)
}


class ProfileViewModel{
    
    var idUser :String?
    let view:ProfileProtocol!
    
    init(view:ProfileProtocol) {
        self.view = view
    }
   
 
 
}

// MARK Extension

extension ProfileViewModel:ProfileVMProtocol{
    
    
    func loadAllData (){
        self.view.showLoader()
        
        APIManager.getLoggin{(result) in
            switch result{
                
            case .success(let data ):
                print(data)
                let age = String(data.age)
                self.view.user(userName: data.name, email: data.email, age: age)
                self.view.IdUser = data.id
                self.getImageAPI(id:data.id)
                self.view.TableView.reloadData()
                self.idUser = data.id
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        self.view.hideLoader()
    }
    
    
    func uploadImage(data: Data){
        APIManager.uploadPhoto(with: data) { (succes)  in
            
            if succes == true {
                print("photo Upload succesfuly")
                self.getImageAPI(id: self.view.IdUser)
            }else{
                print("field Upload Photo")
            }
        }
    }
    
    
    func logOut(){
        self.view.showLoader()
        APIManager.logOutUser { (succes) in
            if succes{
                UserDefaultsManager.shared().token = nil
                self.view.switchToAuthState()
            }else {
                print("logOut not Success")
            }
            self.view.hideLoader()
        }
    }
 
    func getImageAPI(id:String){
        
        self.view.showLoader()
        APIManager.getUserPhoto(whit: id) { (error, data, ImageResponse) in
            guard error == nil  else{
                print(error!.localizedDescription)
                return
            }
            
            if let data = data {
                self.view.getImage(data: data)
            }
            
            print("get image succes")
        }
        self.view.hideLoader()
    }
}






