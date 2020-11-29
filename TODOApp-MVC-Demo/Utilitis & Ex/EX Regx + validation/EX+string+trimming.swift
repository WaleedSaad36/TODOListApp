//
//  EX+string+trimming.swift
//  TODOApp-MVC-Demo
//
//  Created by IDE Academy on 11/9/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
