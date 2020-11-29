//
//  TodoCell.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/6/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configer(Todo: TaskData) {
        descriptionLbl.text = Todo.description
    }
    
}
