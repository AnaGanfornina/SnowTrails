//
//  SnowTrailsTesting.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing


struct DataSourceTesting {
    
    //Probar los puntos del DataSource
    @Suite("pointDataSource")
    class pointDataSourceTests {
        var data: PointData?
        var points: [Point]
        var pointInstance: PointsLoader
        
        init() {
            self.data = PointData()
            self.pointInstance = PointsLoader(fromData: data!) // TODO: Desungrapear esto
            self.points = pointInstance.points
        }
        deinit {
            data = nil
            points = []
        }
        
        @Test func whenInitializedWithDataThenPointsAreLoaded_thenReturn11() {
            var accum = 0
            for _ in points{
                accum += 1
            }
            #expect(accum == 11, "Se espera que el contenido total de los puntos hubicados en accum sea 11")
                
        }
    }
    // Probar las rutas de DataSource
    @Suite("routeDataSource")
    class routeDataSourceTests {
        var data: RouteData?
        var routes: [Route]
        var routeInstance: RoutesLoader
        
        init() {
            self.data = RouteData()
            self.routeInstance = RoutesLoader(fromData: data!) // TODO: Desungrapear esto
            self.routes = routeInstance.routes
        }
    
        @Test func whenInitializedWithDataThenRoutesAreLoaded_thenReturn7(){
            var accum = 0
            for _ in routes {
                accum += 1
            }
            #expect(accum == 7, "Se espera que el contenido total de rutas en accum sea 7")
        }
    }
}
