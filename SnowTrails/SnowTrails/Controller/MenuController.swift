//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

protocol checkOption {
    func checkOption(input: String?, options: [String]) throws -> String?
}

class MenuController: checkOption { // TODO: convertirlo a herencia
    
    
    var description: String
    var choices: [String]
    
    init() {
        self.description =
                        """
                        Bienvenido a SnowTrails
                        1. Acceder como usuario
                        2. Acceder como administrador
                        3. Salir
                        
                        """
        self.choices =  ["1","2","3"]
    }
    func showMenu() {
        Logger.consoleUILogger.info("\(self.description)")
    }
    /// Función que lanza un error en caso de opcion inválida
    func checkOption(input: String?, options: [String]) throws -> String? {
        
        guard let inputVerified = input else {
            return nil
        }
        if !options.contains(inputVerified) {
            Logger.consoleDeveloperLogger.debug("Error al validar la opción del usuario")
            Logger.consoleUILogger.debug("Opcion inválida, por favor intente de nuevo.")
            throw Errors.invalidOption
            
        }
        return input
    }
}

//TODO: Lo que quiero es que optons de checkOption tenga un parámetro por defecto . que lanze un error si no es una de las opciones. Y que cada menu tenga sus opciones.


    



    
    

