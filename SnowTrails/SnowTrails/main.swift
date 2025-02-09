//
//  main.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

func main() {
    var menuAdmin: AdminMenuController?
    var menuUser: UserMenuController?
    
    let menuLogin = LoginMenuController()
    menuLogin.showMenu()
    //Leer opcion del usuario. Mientras la opción no sea salir, siempre hará login
    
    var userChoice = UserChoiceController().readUserChoice()
    //Aqui trataremos que hacer en cada caso
    
    //Hacer login del usuario
    let user = menuLogin.login()
    
    if user is AdminUser {
        print("Ha entrado como admin")
        menuAdmin = AdminMenuController()
        menuAdmin?.showMenu()
        
    } else if user is RegularUser {
        print("Ha entrado como user")
        menuUser = UserMenuController()
        menuUser?.showMenu()
        
        
        
        
        //App().run()
        /*
         Logger().debug("Mensaje cualquiera")
         Logger().info("Mensaje informativo")
         Logger().error("Mensaje de error")
         Logger().fault("Mensaje de fallo")
         
         Logger.consoleUILogger.debug("Mensaje al usuario modo debug")
         */
    }
}

main()
/*
// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}
*/
