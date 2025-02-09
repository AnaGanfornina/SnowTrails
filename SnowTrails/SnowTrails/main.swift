//
//  main.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

func main() {
    let menuLogin = LoginMenuController()
    menuLogin.showMenu()
    
    //Leer opcion del usuario. Mientras la opción no sea salir, siempre hará login
    var userChoice = UserChoiceController().readUserChoice()
    
    while !isExit(input: userChoice) {
        
        let menuAdmin: AdminMenuController?
        let menuUser: UserMenuController?
        let user:User?
        
        
        // Mientras la opción no sea de salida, acabaremos en un login
        // Hacer login del usuario
        let mailAndPassword = menuLogin.askForMailAndPassword()
        
        // Tratamos el error de no encontrar un usuario con esa contraseña y usuario
        do {
            user = try menuLogin.login(mailAndPasword: mailAndPassword)
        }catch Errors.userNotFound {
            user = nil
        }catch{
            print ("Error inserperado")
            user = nil
        }

        switch user {
        case is AdminUser:
            print("Ha entrado como admin")
            menuAdmin = AdminMenuController()
            menuAdmin?.showMenu()
            
        case is RegularUser:
            print("Ha entrado como user")
            menuUser = UserMenuController()
            menuUser?.showMenu()
        default:
            menuLogin.showMenu()
            userChoice = UserChoiceController().readUserChoice()
        }
    }
    
    
    
    
    
    
    
        
        
        //App().run()
        /*
         Logger().debug("Mensaje cualquiera")
         Logger().info("Mensaje informativo")
         Logger().error("Mensaje de error")
         Logger().fault("Mensaje de fallo")
         
         Logger.consoleUILogger.debug("Mensaje al usuario modo debug")
         */
    }


main()
/*
// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}
*/
