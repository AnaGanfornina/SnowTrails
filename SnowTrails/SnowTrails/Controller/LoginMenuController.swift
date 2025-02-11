//
//  LoginMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation

class LoginMenuController: MenuController {
    override init() {
        super.init()
        self.description = "Bienvenido al login\n"
        
    }
    ///Función que pide al usuario el mail y la contraseña.
    ///Los retorna en forma de tupla
    func askForMailAndPassword() -> (mail: String, password: String) {
        // Usuario introduce mail y contraseña
        print("Mail: ")
        let mail = UserChoiceController().readUserChoice()
        print("Contraseña: ")
        let password = UserChoiceController().readUserChoice()
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
            print("Usuario no encontrado, vuelvelo a intentar\n")
            throw Errors.userNotFound
            
        }
        
        return userFoundUnwrapped
    }
}
