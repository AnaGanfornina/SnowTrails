//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation
import OSLog

class MenuController { 
    
    
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
    /// Función que imprime la descripción del menu con un logger.
    func showMenu() {
        Logger.consoleUILogger.info("\(self.description)")
    }
    /// Función que recibe un string opcional y el número de opciones.
    /// En caso de el imput no encontrarse entre las opciones lanza un error.
    /// En caso de no lanzarse el error retornara el imput. El cual seguirá siendo opcional
    
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


    



    
    

