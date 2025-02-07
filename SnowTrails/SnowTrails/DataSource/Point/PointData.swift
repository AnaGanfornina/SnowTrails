//
//  PointData.swift
//  SnowTrails
//
//  Created by Ana on 6/2/25.
//

import Foundation

struct PointData {
    
    /// Función que contiene todos los puntos geograficos
    static func getPointData() -> [Point] {
        return [
            Point(name: "Alpina Grande", latitude: 46.0000, longitude: 7.5000, elevation: 1500.0),
            Point(name: "Alpina Pequeña", latitude: 46.0022, longitude: 7.5200, elevation: 1200.0),
            Point(name: "Pico Nevado", latitude: 46.1000, longitude: 7.6000, elevation: 1600.0),
            Point(name: "Valle Blanco", latitude: 45.9000, longitude: 7.4000, elevation: 1400.0),
            Point(name: "Cumbre Azul", latitude: 46.0500, longitude: 7.5500, elevation: 1550.0),
            Point(name: "Lago Helado", latitude: 46.2000, longitude: 7.7000, elevation: 1700.0),
            Point(name: "Bosque Nevado", latitude: 46.3000, longitude: 7.8000, elevation: 1800.0),
            Point(name: "Cerro Plateado", latitude: 46.1500, longitude: 7.6500, elevation: 1650.0),
            Point(name: "Cascada Blanca", latitude: 46.2500, longitude: 7.7500, elevation: 1750.0),
            Point(name: "Refugio Alpino", latitude: 46.0500, longitude: 7.4500, elevation: 1450.0),
            Point(name: "Refugio Aislado", latitude: 46.0000, longitude: 7.4000, elevation: 1400.0)
        ]
    }

    }


