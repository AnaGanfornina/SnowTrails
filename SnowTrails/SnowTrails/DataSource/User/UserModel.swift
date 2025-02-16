//
//  UserClass.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation
class User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.mail == rhs.mail && lhs.password == rhs.password
    }
    
    
    let name: String
    let mail: String
    let password: String
    
    
    init(name: String, mail: String, password: String) {
        self.name = name
        self.mail = mail
        self.password = password
        
    }
    
    
}


class AdminUser: User {
    
    override init(name: String, mail: String, password: String) {
        super.init(name: name, mail: mail, password: password)
    }
    
}

class RegularUser: User {
    
    override init(name: String, mail: String, password: String) {
        super.init(name: name, mail: mail, password: password)
    }
}
