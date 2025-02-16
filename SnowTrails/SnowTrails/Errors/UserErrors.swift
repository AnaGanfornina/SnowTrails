//
//  Errors.swift
//  SnowTrails
//
//  Created by Ana on 9/2/25.
//

import Foundation
enum Errors: Error {
    case userNotFound
    case invalidOption // TODO: Cambiarlo a otro error
    case duplicateUser
    case invalidUserName
    case invalidUserPassword
    case invalidUserEmail
}

