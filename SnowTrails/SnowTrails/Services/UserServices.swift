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
        
        // TODO: Mensaje de que se ha podido añadir satisfactoriamente.
        // TODO: Lanzar error si no se ha podido lanzar satisfactoriamente
        
    }
    func deleteUser(_ name: String, fromData data: UsersLoader) { //TODO: Borrar lo del id y cambiar por nombre
        
        // Buscamos por nombre
        
        // TODO: Introducir mensaje de error  para cuando no encuentre ningun usuario con ese nombre
        data.users.removeAll { User in
            return User.name == name
        }
        
    }
}
