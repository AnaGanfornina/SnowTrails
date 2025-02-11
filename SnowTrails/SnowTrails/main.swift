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
    let userRepository = UsersLoader(fromData: UserData())// Cargamos los datos originales
    
    while true {
        // MARK: - Menu de Inicio
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
        // MARK: - Menu de Login
        
        // Hacemos Login: Pedimos usuario y contraseña
        guard let mailAndPasswordUnwraped = (menu as? LoginMenuController)?.askForMailAndPassword() else {
            return // TODO: Supongo que aqui lanzaremos un error ? Esto está raro
        }
        // Hacemos login: Tratamos el error de no encontrar un usuario con esa contraseña y usuario
        do {
            user = try (menu as? LoginMenuController)?.login(mailAndPasword: mailAndPasswordUnwraped)
            
        }catch Errors.userNotFound {
            user = nil
            menu = MenuController()
        }catch{
            print ("Error inserperado")
            user = nil
        }
        // MARK: - Menu de Usuario o Admin
        
        // Evaluamos si es admin o regular
        while user is AdminUser {
            let newMenu = AdminMenuController(whithRepository: userRepository)
            newMenu.showMenu()
            //Leer el usuario
            userChoice = UserChoiceController().readUserChoice()
            //Si no es salir...
            if UserChoiceController().isExit(input: userChoice, menu: newMenu){
                menu = MenuController()
                break
            }
            //Ejecutar accion.
            print("Aquí habra ejecutado la acción que queramos")
            
            // Convertimos el string de imput en un entero
            guard let userChoiceInt = Int(userChoice) else {
                print("Opción no válida")// TODO: Implementar errores
                return
            }
            newMenu.executeAxtion(option: userChoiceInt)
        }
        while user is RegularUser {
            let newMenu = UserMenuController()
            newMenu.showMenu()
            //Leer el usuario
            //Si no es salir...
            userChoice = UserChoiceController().readUserChoice()
            if UserChoiceController().isExit(input: userChoice, menu: newMenu){
                menu = MenuController()
                break
            }
            
            //Ejecutar accion.
            
            // Convertimos el string de imput en un entero
            guard let userChoiceInt = Int(userChoice) else {
                print("Opción no válida")// TODO: Implementar errores
                return
            }
            newMenu.executeAxtion(option: userChoiceInt)
        }
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



main()
/*
// MARK: Ejemplo de cómo diferenciar entre logs para el usuario y logs para el desarrollador
extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}
*/
