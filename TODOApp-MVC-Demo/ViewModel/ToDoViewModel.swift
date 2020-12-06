//
//  ToDoPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation

protocol TodoVMProtocol:class{
    func addNewTaskTodo( description:String)
    func deleteTask( id:String)
    func loadAllData ()
    
}


class TOdoViewModel{
    let view:TodoProtocol!
    
    init (view:TodoProtocol){
        self.view = view
    }
    
    
}
extension TOdoViewModel:TodoVMProtocol{
    func deleteTask(id: String) {
        self.view.showLoader()
        APIManager.deletTask(whit: id) { (succeeded) in
            if succeeded{
                print("Done delete task ")
                self.loadAllData()
            }else{
                print("error delete Task")
            }
            
        }
        self.view.hideLoader()
    }
    
    
    func addNewTaskTodo( description:String){
        self.view.showLoader()
        APIManager.addNewTask( description: description) { (succeeded) in
            
            if succeeded{
                print("succses add newData")
                self.loadAllData()
            }else{
                print("task Not Added ")
            }
        }
        self.view.hideLoader()
    }
    
    
    func loadAllData (){
        self.view.showLoader()
        
        APIManager.getAllTodos{(response) in
            
            switch response{
                
            case .failure(let error) :
                
                print(error.localizedDescription)
                
            case .success(let result) :
             
                self.view.addProtocolArr(TodoArr: result.data)
                self.view.TableViwe.reloadData()
            }
            
            self.view.hideLoader()
        }
        
    }
    
}

