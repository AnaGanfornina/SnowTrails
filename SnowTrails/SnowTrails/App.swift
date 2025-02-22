//
//  App.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog


class App {
    
    var menu: MenuController
    var user: User?
    var userChoice: String?
    let userRepository: UsersLoader
    
    init() {
        self.menu = MenuController()
        self.userRepository = UsersLoader(fromData: UserData())// Cargamos los datos originales
    }
    
    /// Función encargada de poner en marcha el flujo del programa
    func run() {
    
        while true {
            // MARK: - Menu de Inicio
            menu.showMenu()
            // Leer opcion del usuario.
            userChoice = UserChoiceController().readUserChoice()
            
            // Comprobar que lo introducido sea una de las opciones del menu. .
            // Y aquí tratar el error
            do {
                userChoice = try menu.checkOption(input: userChoice, options: menu.choices)
            } catch Errors.invalidOption {
                Logger.consoleDeveloperLogger.error("Opción inválida")
                continue
            } catch {
                Logger.consoleDeveloperLogger.error("Error inesperado")
                continue
                
            }
            //En caso de ser nil, vuelve a pedir el usuario volviendo arriba del bucle

            guard let userChoiceVerified = userChoice else {
                continue
            }
            

            // Mientras la opción no sea salir de aqui no sale.
            if UserChoiceController().isExit(input: userChoiceVerified, menu: menu){
                Logger.consoleUILogger.info("Saliendo del programa...")
                
                break
            }
            // MARK: - Menu de Login
            
            // Mostramos menu de login
            menu = LoginMenuController()
            menu.showMenu()
            
            
            // Hacemos Login: Pedimos usuario y contraseña
            guard let mailAndPasswordUnwraped = (menu as? LoginMenuController)?.askForMailAndPassword() else {
                
                Logger.consoleDeveloperLogger.debug("Error al leer el usuario y contraseña")
                continue
                
            }
            // Hacemos login: Tratamos el error de no encontrar un usuario con esa contraseña y usuario
            do {
                user = try (menu as? LoginMenuController)?.login(mailAndPasword: mailAndPasswordUnwraped)
                
            }catch Errors.userNotFound {
                user = nil
                menu = MenuController()
            }catch{
                Logger.consoleDeveloperLogger.error("Error inserperado")
                user = nil
            }
            // MARK: - Menu de Usuario o Admin
            
            // Evaluamos si es admin o regular
            while user is AdminUser {
                // MARK: - Menu de Usuario
                let newMenu = AdminMenuController(whithRepository: userRepository)
                
                newMenu.showMenu()
                //Leer el usuario
                
                userChoice = UserChoiceController().readUserChoice()
                
                // Comprobamos que sea una opcon válida
                
                do {
                    userChoice = try menu.checkOption(input: userChoice, options: newMenu.choices)
                } catch Errors.invalidOption {
                    userChoice = nil
                } catch {
                    Logger.consoleDeveloperLogger.error("Error inesperado")
                    userChoice = nil
                }
                guard let userChoiceVerified = userChoice else {
                    continue
                }
                
                //Si no es salir...
                if UserChoiceController().isExit(input: userChoiceVerified, menu: newMenu){
                    Logger.consoleUILogger.info("Ha salido del menu de Adminsitrador")
                    menu = MenuController()
                    break
                }
                //Ejecutar accion.
                
                
                // Convertimos el string de imput en un entero
                guard let userChoiceInt = Int(userChoiceVerified) else {
                    Logger.consoleDeveloperLogger.error("No se ha podido transformar a entero la opción")// 
                    return
                }
                
                do {
                    try newMenu.executeAction(option: userChoiceInt)
                } catch Errors.duplicateUser {
                    continue
                } catch Errors.userNotFound {
                    continue
                }catch {
                    Logger.consoleDeveloperLogger.error("Error inesperado al añadir usuario")
                }
                
            }
            while user is RegularUser {
                // MARK: - Menu de Usuario
                let newMenu = UserMenuController()
                
                newMenu.showMenu()
                //Leer el usuario

                userChoice = UserChoiceController().readUserChoice()
                
                // Comprobamos que sea una opcon válida
                
                do {
                    userChoice = try menu.checkOption(input: userChoice, options: newMenu.choices)
                } catch Errors.invalidOption {
                    
                    userChoice = nil
                } catch {
                    Logger.consoleDeveloperLogger.error("Error inesperado")
                    userChoice = nil
                }
                guard let userChoiceVerified = userChoice else {
                    continue
                }
                
                //Si no es salir...
                if UserChoiceController().isExit(input: userChoiceVerified, menu: newMenu){
                    menu = MenuController()
                    Logger.consoleUILogger.info("Ha salido del menu de Usuario")
                    break
                }
                
                //Ejecutar accion.
                
                // Convertimos el string de imput en un entero
                guard let userChoiceInt = Int(userChoiceVerified) else {
                    Logger.consoleDeveloperLogger.error("No se ha podido convertir la opcion a entero")
                    return
                }
                newMenu.executeAxtion(option: userChoiceInt)
            }            
        }
        
    }
}
