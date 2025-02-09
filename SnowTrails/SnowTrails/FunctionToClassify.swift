//
//  FunctionToClassify.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation

func isExit(input: String) -> Bool {
    if input.lowercased() == "3"{
        print("Bye Bye") // TODO: Cambiar esto, queda redundante
    }
    
    return input.lowercased() == "3" //Esto habrá que cambiarlo por un tipoenum?
}
