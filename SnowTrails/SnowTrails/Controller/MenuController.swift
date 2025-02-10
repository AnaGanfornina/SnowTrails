//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation

class MenuController {
    var description: String
    
    init() {
        self.description =
                        """
                        Bienvenido a SnowTrails
                        1. Acceder como usuario
                        2. Acceder como administrador
                        3. Salir
                        
                        """
    }
    func showMenu() {
        print(description)
    }
}




    



    
    

