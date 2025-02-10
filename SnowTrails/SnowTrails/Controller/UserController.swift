//
//  UserController.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation

struct UserChoiceController {
    ///Función que lee el imput del usuario y devuelve un string
    func readUserChoice() -> String {
        let userChoice = readLine() ?? "" //TODO: Tratamiento de erores
        return userChoice
    }
    /// Predicado que evalua un imput para saber si debe o no salir del programa en función del menú en el que se encuentre
    func isExit(input: String, menu: MenuController) -> Bool {
        let exitOption: String?
        
        switch menu {
        case is MenuController:
            exitOption = "3"
        case is UserMenuController:
            exitOption = "3"
        case is AdminMenuController:
            exitOption = "5"
        }
        return input  == exitOption //añadir aqui algun tipo de closure para imprimir
    }
    
}





