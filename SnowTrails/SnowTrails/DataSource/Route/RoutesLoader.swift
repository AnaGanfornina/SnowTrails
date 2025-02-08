//
//  RoutesLouder.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation

class RoutesLoader {
    var routes: [Route]
    init(fromData data: RouteData){
        //Cargamos las rutas del RouteData para que estén en RoutesLouder
        self.routes = RouteData.getRouteData()
    }
}
