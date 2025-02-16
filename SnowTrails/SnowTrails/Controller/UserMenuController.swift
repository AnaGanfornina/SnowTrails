//
//  UserMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation
import OSLog

class UserMenuController: MenuController {
    override init() {
        super.init()
        self.description =
                    """
                    
                    Menú usuario - Selecciona una opción:
                    1. Ver todas las rutas
                    2. Obtener la ruta más corta entre dos puntos
                    3. Log out
                    
                    """
    }
    /// Función que recibe un entero y lo evalua. En función del numero recibido ejecutará una acción u otra.
    func executeAxtion(option: Int) -> Void {
        switch option {
        case 1:
            Logger.consoleUILogger.info("Ver todas las rutas")
            let routes = RoutesServices().viewAllRoutes()
            // Imprimir rutas
            for route in routes {
                let distance = RoutesServices().calculateRouteDistance(points: route.points)
                let roundedDistance = String(format:"%.2f", distance)
                
                Logger.consoleUILogger.info("\(route.name) --- \(roundedDistance) Km" )
            }
            
        case 2:
            Logger.consoleUILogger.info("Obtener la ruta más corta entre dos puntos")
            // TODO: Desmepaquetar y tratar errores de que no se haya encontrado una ruta
            let shortestRoute = RoutesServices().getTheShortesRoute()
            //Logger.consoleUILogger.info(shortestRoute)
            
        default:
            Logger.consoleUILogger.error("Opción no válida")
        }
    }
}
