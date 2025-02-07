//
//  main.swift
//  SnowTrails
//
//  Created by Ana on 6/2/25.
//

import Foundation

func main(){
    
    let puntos = PointsLoader(fromData: PointData()).points
    
    for item in puntos {
        print(item)
    }
}
main()
