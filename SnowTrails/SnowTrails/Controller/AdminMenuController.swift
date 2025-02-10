//
//  AdminMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation

class AdminMenuController: MenuController {
    override init() {
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
        
    }
    //ESTO ES UNA IDEA FELIZ
    // TODO: Habrá que hacer que pase de un str a un int
    func executeAxtion(option: Int) -> Void {
        switch option {
        case 1:
            print("Ver todos los usuarios")
            let users = UserServices().viewAllUsers()
            // Imprimir usuarios
            for item in users {
                print(item)
            }
        case 2:
            print("Añadir usuario")
            //Pedir usuario
            
            UserServices().appendUser(<#T##user: User##User#>)
            
        case 3:
            print("Eliminar usuario")
            // Pedir usuario
            UserServices().deleteUser(withID: <#T##Int#>)
            
        case 4:
            print("Añadir punto a una ruta")
            //Pedir un punto
            RoutesServices().appendPointToRoute(point: <#T##Point#>)
            
        default:
            print("Opción no válida")
        }
    }
    
}


