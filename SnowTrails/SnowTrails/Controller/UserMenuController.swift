//
//  UserMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation

class UserMenuController: MenuController {
    override init() {
        super.init()
        self.description =
                    """
                    
                    Menú usuario - Selecciona una opción:
                    1. Ver todas las rutas
                    2. Obtener la ruta m´as corta entre dos puntos
                    3. Log out
                    
                    """
    }
    // TODO: Habrá que hacer que pase de un str a un int
    func executeAxtion(option: Int) -> Void {
        switch option {
        case 1:
            print("Ver todas las rutas")
            let routes = RoutesServices().viewAllRoutes()
            // Imprimir rutas
            for item in routes {
                print(item)
            }
            
        case 2:
            print("Obtener la ruta más corta entre dos puntos")
            // TODO: Desmepaquetar y tratar errores de que no se haya encontrado una ruta
            let shortestRoute = RoutesServices().getTheShortesRoute()
            print(shortestRoute)
            
        default:
            print("Opción no válida")
        }
    }
}
