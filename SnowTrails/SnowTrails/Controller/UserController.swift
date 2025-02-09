//
//  UserController.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation

struct UserChoiceController {
    func readUserChoice() -> String {
        let userChoice = readLine() ?? "" //TODO: Tratamiento de erores
        return userChoice
    }
    
}





