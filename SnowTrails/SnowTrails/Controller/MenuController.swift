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
        let loginDescription = //Esto deberias cambiarlo
                    """
                    Bienvenido a SnowTrails
                    1. Acceder como usuario
                    2. Acceder como administrador
                    3. Salir
                    """
        super.init(description: loginDescription)
    }
    ///Función qeu pide al usuario el mail y la contraseña.
    ///Los retorna en forma de tupla
    func askForMailAndPassword() -> (mail: String, password: String) {
        // Usuario introduce mail y contraseña
        print("Bienvenido al Login")
        print("Mail: ")
        var mail = UserChoiceController().readUserChoice()
        print("Contraseña: ")
        var password = UserChoiceController().readUserChoice()
        return (mail, password)
    }
    ///Función para verificar el usuaro y contraseñas dados y logearse como Usuario o Administrador
    func login(mailAndPasword: (String,String)) throws -> User? {
        let mail = mailAndPasword.0
        let password = mailAndPasword.1
        
        //Buscamos en user data
        let usersData = UserData.getUsers()
        let userFound = usersData.filter { $0.mail == mail && $0.password == password }
        //Cogeos el primer elemento de la lista de usser encontrado //TODO: Tratamiento de errores si no encuentra el usuario
        guard let userFoundUnwrapped = userFound.first else {
            print("Usuario no encontrado, vuelvelo a intentar")
            throw Errors.userNotFound
            
        }
        
        return userFoundUnwrapped
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
