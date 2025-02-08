//
//  RouteData.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation

struct RouteData {
    static var points = PointsLoader(fromData: PointData()).points
    
    static func getRouteData() -> [Route] {
        // MARK: No es buena idea acceder por posicion verdad ?
        return [
            Route(name: "Ruta del Pico Nevado y Lago Helado", points: [points[0], points[2], points[5]]),
            Route(name: "Ruta del Valle Blanco y Refugio Alpino", points: [points[0], points[3], points[9]]),
            Route(name: "Ruta de la Cumbre Azul y Cerro Plateado", points: [points[0], points[4], points[7]]),
            Route(name: "Ruta del Bosque Nevado y Cascada Blanca", points: [points[5], points[6], points[8]]),
            Route(name: "Ruta completa de Alpina Grande a Cascada Blanca", points: [points[0], points[2], points[5], points[6],points[8]]),
            Route(name: "Ruta del Refugio Aislado", points: [points[10]]),
            Route(name: "Ruta Alpina", points: [points[0], points[1]])
        ]
    }
}

