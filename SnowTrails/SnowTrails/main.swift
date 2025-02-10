//
//  main.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

func main() {
    
    // MARK: Opcion 3
    
    var menu = MenuController()
    var user: User?
    
    while true {
        menu.showMenu()
        // Leer opcion del usuario.
        var userChoice = UserChoiceController().readUserChoice()
        
        // Mientras la opción no sea salir de aqui no sale.
        if UserChoiceController().isExit(input: userChoice, menu: menu){
            break
        }
        // Mostramos menu de login
        menu = LoginMenuController()
        menu.showMenu()
        // Hacemos Login: Pedimos usuario y contraseña
        guard let mailAndPasswordUnwraped = (menu as? LoginMenuController)?.askForMailAndPassword() else {
            return // TODO: Supongo que aqui lanzaremos un error ? Esto está raro
        }
        // Hacemos login: Tratamos el error de no encontrar un usuario con esa contraseña y usuario
        do {
            user = try (menu as? LoginMenuController)?.login(mailAndPasword: mailAndPasswordUnwraped)
            
        }catch Errors.userNotFound {
            user = nil
        }catch{
            print ("Error inserperado")
            user = nil
        }
        
        // Evaluamos si es admin o regular
        while user is AdminUser {
            menu = AdminMenuController()
            menu.showMenu()
            //Leer el usuario
            userChoice = UserChoiceController().readUserChoice()
            //Si no es salir...
            if UserChoiceController().isExit(input: userChoice, menu: menu){
                menu = MenuController()
                break
            }
            //Ejecutar accion
            print("Aquí habra ejecutado la acción que queramos")
        }
        while user is RegularUser {
            menu = UserMenuController()
            menu.showMenu()
            //Leer el usuario
            //Si no es salir...
            userChoice = UserChoiceController().readUserChoice()
            if UserChoiceController().isExit(input: userChoice, menu: menu){
                menu = MenuController()
                break
            }
            
            //Ejecutar accion. Is this a closure?
            print("Aquí habra ejecutado la acción que queramos")
        }
    }
    
    
    // MARK: Opcion 2
    /*
    var menu = MenuController()
    var user: User?
    // Leer en qué menu se está y mostrar opciones
    menu.showMenu()
    // Leer al usuario
    var userChoice = UserChoiceController().readUserChoice()
    //Comprobar que la opción no sea salir
    guard !isExit(input: userChoice) else { return }
    
    //Mientras la opción no sea salir, siempre hará login
    //Casteamos la variable menu para que sea de tipo Login
     
     //otra opcion: (menu as? LoginMenuController)?.askForMailAndPassword()
    if let LoginMenuController = menu as? LoginMenuController {
        //Aqui tenemos el loginMenu controller
    }else{
        
    }
  
    menu.showMenu()
    menu.
    
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
    
     */
   // MARK: Opcion 1
    
    /*
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
     */
    }
    
    
    
    
    
    
    
        
        
        //App().run()
        /*
         Logger().debug("Mensaje cualquiera")
         Logger().info("Mensaje informativo")
         Logger().error("Mensaje de error")
         Logger().fault("Mensaje de fallo")
         
         Logger.consoleUILogger.debug("Mensaje al usuario modo debug")
         */



main()
/*
// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}
*/
