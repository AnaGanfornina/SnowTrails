//
//  PointLoader.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation

class PointsLoader {
    var points: [Point]
    
    init(fromData data: PointData) {
        
        // Cargamos los puntos del PointData para que estén en PointsLoader
        self.points = PointData.getPointData()

    }
   
    }
