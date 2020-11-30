//
//  ToDoPresenter.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation


class TodoPresenter{
    let view:TodoProtocol!
    
    init (view:TodoProtocol){
        self.view = view
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
//                var todoDecsriptionARR: [String] = []
//                for todo in result.data {
//                    todoDecsriptionARR.append(todo.description ?? "")
//                }
                self.view.addProtocolArr(TodoArr: result.data)
                
//                self.view.todoArr = result.data
                self.view.TableViwe.reloadData()
              // self.view.tableView.reloadData()
            }
        
        self.view.hideLoader()
    }
    
}


}
