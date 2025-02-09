//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation

class MenuController {
    let description: String
    
    init(description: String = "") {
        self.description = description
    }
    func showMenu() {
        print(description)
    }
    
}

class LoginMenuController: MenuController {
    init() {
        let loginDescription =
                    """
                    Bienvenido a SnowTrails
                    1. Acceder como usuario
                    2. Acceder como administrador
                    3. Salir
                    """
        super.init(description: loginDescription)
    }
    func login() -> User? {
        // Usuario introduce mail y contraseña
        print("Bienvenido al Login")
        print("Mail: ")
        var mail = UserChoiceController().readUserChoice()
        print("Contraseña: ")
        var password = UserChoiceController().readUserChoice()
        //Buscamos en user data
        let usersData = UserData.getUsers()
        let userFound = usersData.filter { $0.mail == mail && $0.password == password }
        //Cogeos el primer elemento de la lista de usser encontrado //TODO: Tratamiento de errores si no encuentra el usuario
        
        return userFound.first
    }
}

class UserMenuController: MenuController {
    init() {
        let UserMenuDescription =
                    """
                    Menú usuario - Selecciona una opción:
                    1. Ver todas las rutas
                    2. Obtener la ruta m´as corta entre dos puntos
                    3. Log out
                    """
        super.init(description: UserMenuDescription)
    }
    
}

class AdminMenuController: MenuController {
    init() {
        let adminMenuDescription =
            """
            Menú admin - Selecciona una opción:
            1. Ver todos los usuarios
            2. Añadir usuario
            3. Eliminar usuario
            4. Añadir punto a una ruta
            5. Logout
            """
        super.init(description: adminMenuDescription)
    }
    
    
}
