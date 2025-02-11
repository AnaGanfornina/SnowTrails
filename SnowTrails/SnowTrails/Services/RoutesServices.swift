//
//  RoutesServices.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
struct RoutesServices {
    func viewAllRoutes() -> [Route] {
        
        return RoutesLoader(fromData: RouteData()).routes
    }
    
    func getTheShortesRoute() -> Route? {
        //TODO: Por impmplementar
        print ("Aqui te mostraría la ruta mas corta")
        return nil
    }
    
    func appendPointToRoute(point: Point) {
        //TODO: Por impmplementar
       
        print ("Aqui se agregara un punto a la ruta")
    }
}
