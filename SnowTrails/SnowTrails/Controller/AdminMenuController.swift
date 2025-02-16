//
//  AdminMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation
import OSLog

class AdminMenuController: MenuController {
    let userRepository: UsersLoader
     init(whithRepository userRepository: UsersLoader) {
        self.userRepository = userRepository
        super.init()
        self.description =
        
            """
            
            Menú admin - Selecciona una opción:
            1. Ver todos los usuarios
            2. Añadir usuario
            3. Eliminar usuario
            4. Añadir punto a una ruta
            5. Logout
            
            """
         self.choices =  ["1","2","3","4","5"]
        
    }
    /// Función que recibe un entero y lo evalua. En función del numero recibido ejecutará una acción u otra.
    /// Lanza errores procedentes de UserServices en las opciones 2 y 3
    func executeAction(option: Int) throws -> Void {
        switch option {
        case 1:
           
            let users = UserServices().viewAllUsers(fromData: userRepository)
            // Imprimir usuarios 
            for item in users { 
                switch item {
                case is AdminUser:
                    let rol = "Admin"
                    Logger.consoleUILogger.info("\(rol): \(item.name) --- Email: \(item.mail)")
                case is RegularUser:
                    let rol = "Regular User"
                    Logger.consoleUILogger.info("\(rol): \(item.name) --- Email: \(item.mail)")
                default:
                    let rol = "Desconocido"
                    Logger.consoleUILogger.error("\(rol): \(item.name) --- Email: \(item.mail)")
                }
                
            }
        case 2:
            Logger.consoleUILogger.info("Añadir usuario")
            //Pedir usuario
            
            Logger.consoleUILogger.info("Introduce el nombre del usuario que quieres añadir: ")
            let name = UserChoiceController().readUserChoice()
            
            Logger.consoleUILogger.info("Introduce el email del usuario que quieres añadir: ")
            let mail = UserChoiceController().readUserChoice()
            
            Logger.consoleUILogger.info("Introduce la contraseña del usuario que quieres añadir: ")
            let password = UserChoiceController().readUserChoice()
            
            let newUser = RegularUser(name: name, mail: mail, password: password)
            
            do {
                try UserServices().appendUser(newUser, fromData: userRepository)
            }catch {
                Logger.consoleUILogger.error("No se ha podido añadir el usuario. Vuelvalo a intentar")
            }
            
            
        case 3:
            Logger.consoleUILogger.info("Eliminar usuario")
            // Pedir usuario
            Logger.consoleUILogger.info("Introduzca el nombre del usuario:")
            
            let name = UserChoiceController().readUserChoice()
            
            
            try UserServices().deleteUser(name, fromData: userRepository)
            
        case 4:
            //Pedir un punto
            Logger.consoleUILogger.info("Introduzca punto a una ruta: ")
            let point = UserChoiceController().readUserChoice()
            
            // Aqui transformar lo que nos da el usuario en un punto
            let newPoint = Point(name: "Prueba", latitude: 0, longitude: 0, elevation: 0)
            RoutesServices().appendPointToRoute(point: newPoint)
            
        default:
            Logger.consoleUILogger.error("Opción no válida")
        }
    }
    
}


