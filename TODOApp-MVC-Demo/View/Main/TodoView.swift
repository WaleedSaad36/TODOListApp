//
//  TodoView.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TodoView: UIView {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    func setUp()  {
        setUpTableView(TableView: tableView)
        setUpBackground()
    }
    
    }
    
extension TodoView{
    private func setUpBackground(){
        self.background.image = UIImage(named: "background 2")
    }
    
    
    private func setUpTableView(TableView:UITableView) {
        TableView.separatorStyle = .none
        TableView.backgroundColor = UIColor.clear
        TableView.isOpaque = false
    }
    
}

