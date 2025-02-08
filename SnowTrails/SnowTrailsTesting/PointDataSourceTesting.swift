//
//  SnowTrailsTesting.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing

// Aquí podéis cambiarle el nombre y añadir más tests de otra clase, struct o archivo
struct PointDataSourceTesting {
    
    @Suite("pointDataSource")
    class pointDataSourceTests {
        var data: PointData?
        var points: [Point]
        var pointInstance: PointsLoader
        
        init(data: PointData, points: [Point]) {
            self.data = PointData()
            self.pointInstance = PointsLoader(fromData: data)
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
    
}
