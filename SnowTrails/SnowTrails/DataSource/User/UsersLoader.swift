//
//  UsersLoader.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation
class UsersLoader {
    var users: [User]
    init(fromData data: UserData){
        //Cargamos los usuarios del RouteData para que estén en UsersLouder
        self.users = UserData.getUsers()
    }
}
