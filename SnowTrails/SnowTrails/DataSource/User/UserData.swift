//
//  UserData.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation

struct UserData {
    
    ///Función que retorna la lista de usuarios
    static func getUsers() -> [User] {
        return [
            AdminUser(name: "Adminuserkeepcoding1", mail: "adminuser@keepcoding.es", password: "Adminuser1"),
            RegularUser(name: "Regularuserkeepcoding1", mail: "regularuser@keepcoding.es", password: "Regularuser1")
            
        ]
    }
}
