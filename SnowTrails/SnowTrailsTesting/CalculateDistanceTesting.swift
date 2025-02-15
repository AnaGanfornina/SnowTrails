//
//  CalculateDistanceTesting.swift
//  SnowTrailsTesting
//
//  Created by Ana on 13/2/25.
//

import Testing

class CalculateDistanceTesting {
    @Suite("calculateTotalDistanceOfEachRoute")
    class CalculateDistance{
        var routeServiceInstance: RoutesServices?
        var routes: [Route]
        init() {
            self.routeServiceInstance = RoutesServices()
            self.routes = routeServiceInstance!.viewAllRoutes()  // TODO: Desungrapear esto
        }
        deinit{
            routes = []
            routeServiceInstance = nil
        }
        
        @Test
        func whenTheNameAndDistanceIsCorrect_thenReturnRutaDelPicoNevadoYLagoHeladoAnd27Km () {
            #expect(routes[0].name == "Ruta del Pico Nevado y Lago Helado" ,"Se espera que retorne Ruta del Pico Nevado.")
            #expect(routeServiceInstance.calculateRouteDistance(points: routes[0].points).rounded() == 27.0, "Se espera que retorne 27 Km.")
        }
    }

}
