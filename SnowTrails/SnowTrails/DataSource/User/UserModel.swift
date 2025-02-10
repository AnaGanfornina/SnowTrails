//
//  UserClass.swift
//  SnowTrails
//
//  Created by Ana on 8/2/25.
//

import Foundation
class User {
    let ID: Int
    let name: String
    let mail: String
    let password: String //TODO: Esto debería ser privado
    
    
    init(name: String, mail: String, password: String) {
        self.ID = Int.random(in: 1...100)
        self.name = name
        self.mail = mail
        self.password = password
        
    }
    
}


class AdminUser: User {
    
    override init(name: String, mail: String, password: String) {
        super.init(name: name, mail: mail, password: password)
    }
    
}

class RegularUser: User {
    
    override init(name: String, mail: String, password: String) {
        super.init(name: name, mail: mail, password: password)
    }
}
// TODO: Revisar eso: Si miro el código y hay un método que te permite obtener el rol del usuario, el objetivo ya está conseguido.Si además puedes usar eso para algo, pues mejor para ti porque aparte de completar el enunciado has usado la función para algo más
