//
//  UserServices.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
import OSLog

struct UserServices {
    /// Función que retorna los usuarios en forma de array, habiendolos obtenido del data introducido por parámetro
    func viewAllUsers(fromData data: UsersLoader) -> [User] {
        // Introducir todo el listado de usuarios
        
        return  data.users
    }
    
    /// Función que añade el usuario a data.
    /// Lanza un error en caso de encontrar un usuario igual.
    func appendUser(_ user: User, fromData data: UsersLoader) throws {
        //Añaidr usuario al Data de users
        //Solo puede añadir usuarios normales
        
        // Añadimos el nuevo usuario
        
        if data.users.contains(user){
            Logger.consoleUILogger.info("El usuario ya existe")
            throw Errors.duplicateUser
            
        }
        data.users.append(user)
        Logger.consoleUILogger.info("Usuario añadido satisfactoriamente")
    
        
    }
    /// Función que elimina el usuario mediante el nombre ingresado.
    /// Lanza un error en caso de no encontrarlo
    func deleteUser(_ name: String, fromData data: UsersLoader) throws {
        
        // Buscamos por nombre
        // Si no encuentra ninguno lanza un error
        if !data.users.contains(where: { $0.name == name }){
            Logger.consoleUILogger.info("No existe ningun usuario con ese nombre")
            throw Errors.userNotFound
            
        }
        // Si lo encuentra borra todos aquellos que tengan ese nombre
        data.users.removeAll { User in
            Logger.consoleUILogger.info("El usuario ha sido eliminado satisfactoriamente")
            return User.name == name
        }
        
    }
}
