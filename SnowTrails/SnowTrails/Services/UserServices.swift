//
//  UserServices.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
struct UserServices {
    func viewAllUsers() -> [User] {
        // Introducir todo el listado de usuarios
     
        return  UsersLoader(fromData: UserData()).users // Tal y como está, estás devolviendo el UserData original. De modo que luego lo que tienes que hacer es "modificar" el original
    }
    func appendUser(_ user: User) {
        //Añaidr usuario al Data de users
        //Solo puede añadir usuarios normales
    }
    func deleteUser(withID id: Int) {
        // Eliminar usuario por mail o ID //TODO: Añadir ID a función
    }
}
