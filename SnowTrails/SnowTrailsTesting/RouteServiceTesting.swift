//
//  RouteServiceTesting.swift
//  SnowTrailsTesting
//
//  Created by Ana on 13/2/25.
//

import Testing

class RouteServiceTesting {

    @Suite("viewAllRoutes")
    class viewAllRoutesTests {
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
        @Test func whenInitializedWhithAllRoutes_theReturnIs7() {
            #expect(routes.count == 7,"Se espera que el contenido total de los puntos hubicados en accum sea 7")
        }
    }
    

}

