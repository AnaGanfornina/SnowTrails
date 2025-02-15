//
//  RoutesServices.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
import OSLog

struct RoutesServices {
    func viewAllRoutes() -> [Route] {
        
        return RoutesLoader(fromData: RouteData()).routes
    }
    
    func getTheShortesRoute() -> Route? {
        //TODO: Por impmplementar
        Logger.consoleUILogger.info ("Aqui te mostraría la ruta mas corta")
        return nil
    }
    
    func appendPointToRoute(point: Point) {
        //TODO: Por impmplementar
       
        Logger.consoleUILogger.info ("Aqui se agregara un punto a la ruta")
    }
}

extension RoutesServices {
    
    /// Función que calcula la suma total de las distancias entre los puntos dados.
    func calculateRouteDistance(points: [Point] )-> Double {

        let total = (0..<points.count - 1).reduce(0.00) { partialResult, i in
            partialResult + distance(between: points[i], and: points[i + 1])
        }

        return total
        }


    /// Función para calcular la distancia enter dos puntos.
    /// Retorna la distancia en Km
    func distance(between firstPoint: Point, and secondPoint: Point) -> Double {
        
        //Aplicamos la formula de Haversine para conseguir la distancia 2D
        let distance2D = calculateHaversineDistance(point1: firstPoint, point2: secondPoint)
        
        let difference = calculateAltitudeDifference(point1: firstPoint, point2: secondPoint)
        
        return applyPythagoreanTheorem(distance: distance2D, altitudeDifference: difference)
        
    }

    /// Función que convierte los grados en radianes
    func degreesToRadians(degrees: Double) -> Double { //MARK: Duda de como llamar a la funcion: como está? o mejor "convertDegreesToRadians ?
        
        return degrees * (Double.pi / 180)
    }
    /// Calcula la distancia entre dos puntos en dos dimensiones sin tener en cuenta la altitud.
    func calculateHaversineDistance(point1: Point, point2: Point) -> Double {
        
        let earthRadius = 6371.0 // Radio de la Tierra en Km
        
        // Convertimos latitud y longitud de grados a radianes
            
        let lat1Radians = degreesToRadians(degrees: point1.latitude)
        let lat2Radians = degreesToRadians(degrees: point2.latitude)
        let lon1Radians = degreesToRadians(degrees: point1.longitude)
        let lon2Radians = degreesToRadians(degrees: point2.longitude)

        // Calculamos las diferencias (Delta)
        
        let dLat = lat2Radians - lat1Radians
        let dLon = lon2Radians - lon1Radians
        
        // Formula de Haversine. Para calcular la distancia en 2D
        
        let a = pow(sin(dLat / 2), 2) + cos(lat1Radians) * cos(lat2Radians) * pow(sin(dLon / 2), 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a)) //MARK: No para serte sincera la realidad es que esto no se lo que hace

        // Distancia en metros sobre la superficie de la tierra
        
        let surfaceDistance2D = earthRadius * c
        
        return surfaceDistance2D
    }
    /// Calcula la diferencia entre dos altitudes en km
    func calculateAltitudeDifference(point1: Point, point2: Point) -> Double {
        
        return (point1.elevation - point2.elevation) / 1000.0
    }

    /// Aplica el teorema de pitágoras sobre una distancia y una diferencia de altitudes dada para obtener la diferencia entre dos puntos en 3D
    func applyPythagoreanTheorem(distance: Double, altitudeDifference: Double) -> Double {
         
        return sqrt(pow(distance, 2) + pow(altitudeDifference, 2))
    }

}
