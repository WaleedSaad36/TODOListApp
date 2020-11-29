//
//  UserData.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/11/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
struct UserData: Codable{
    var id: String
    var name, email: String
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case age, name, email
        case id = "_id"
    }
}
