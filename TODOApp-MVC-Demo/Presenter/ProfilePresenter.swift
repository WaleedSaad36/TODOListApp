//
//  ProfilePresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//


import Foundation

class ProfilePresenter{
    
    var view:ProfileVC!
    init(view:ProfileVC) {
        self.view = view
    }
    
    
    func loadAllData (){
        self.view.showLoader()
        
        APIManager.getLoggin{(result) in
            switch result{
                
            case .success(let data ):
                print(data)
                self.view.userNameLbl.text = data.name
                self.view.ageLbl.text = String(data.age)
                self.view.emailLbl.text = data.email
                self.view.idUser = data.id
                self.getImageAPI(id:self.view.idUser)
                self.view.tableView.reloadData()
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
                self.getImageAPI(id: self.view.idUser)
            }else{
                print("field Upload Photo")
            }
            
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
    
    
    func logOut(){
        self.view.showLoader()
    APIManager.logOutUser { (succes) in
    if succes{
    
    UserDefaultsManager.shared().token = nil
        self.view.goToSignIn()
    }else {
    print("logOut not Success")
    }
        self.view.hideLoader()
    }
    
    }
    
}





