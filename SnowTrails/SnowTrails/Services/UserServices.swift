//
//  UserServices.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
struct UserServices {
    func viewAllUsers(fromData data: UsersLoader) -> [User] {
        // Introducir todo el listado de usuarios
        
        return  data.users
    }
    
    func appendUser(_ user: User, fromData data: UsersLoader) {
        //Añaidr usuario al Data de users
        //Solo puede añadir usuarios normales
        
        // Añadimos el nuevo usuario
        data.users.append(user)
        
    }
    func deleteUser(whithID id: Int, fromData data: UsersLoader) {
        // Eliminar usuario por  ID
        
        // Buscamos por id
        
        
        data.users.removeAll { User in
            return User.ID == id
        } //TODO: Revisa esto, dudo que haya salido bien
        
    }
}
