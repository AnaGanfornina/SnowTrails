//
//  AdminMenuController.swift
//  SnowTrails
//
//  Created by Ana on 10/2/25.
//

import Foundation

class AdminMenuController: MenuController {
    let userRepository: UsersLoader
     init(whithRepository userRepository: UsersLoader) {
        self.userRepository = userRepository
        super.init()
        self.description =
        
            """
            
            Menú admin - Selecciona una opción:
            1. Ver todos los usuarios
            2. Añadir usuario
            3. Eliminar usuario
            4. Añadir punto a una ruta
            5. Logout
            
            """
        
    }
    //ESTO ES UNA IDEA FELIZ
    // TODO: Habrá que hacer que pase de un str a un int
    func executeAxtion(option: Int) -> Void {
        switch option {
        case 1:
            print("Ver todos los usuarios")
            let users = UserServices().viewAllUsers(fromData: userRepository)
            // Imprimir usuarios // TODO: Ver el formato en el que se imprime, tengo que poder ver el id
            for item in users {
                print(item)
            }
        case 2:
            print("Añadir usuario")
            //Pedir usuario
            
            print("Introduzca el nombre del usuario: ")
            let name = UserChoiceController().readUserChoice()
            
            print("Introduzca el correo del usuario: ")
            let mail = UserChoiceController().readUserChoice()
            
            print("Introduzca la contraseña del usuario: ")
            let password = UserChoiceController().readUserChoice()
            
            let newUser = User(name: name, mail: mail, password: password)
            
            UserServices().appendUser(newUser, fromData: userRepository)
            
        case 3:
            print("Eliminar usuario")
            // Pedir usuario
            print("Introduzca el ID del usuario:")
            
            guard let id = Int(UserChoiceController().readUserChoice()) else {
                return // TODO: Lanzar algun tipo de error si no se ha podido convertir a número/ o volver a pedir
            }
            UserServices().deleteUser(whithID: id, fromData: userRepository)
            
        case 4:
            //Pedir un punto
            print("Introduzca punto a una ruta: ")
            let point = UserChoiceController().readUserChoice()
            // Aqui transformar lo que nos da el usuario en un punto
            let newPoint = Point(name: "Prueba", latitude: 0, longitude: 0, elevation: 0)
            RoutesServices().appendPointToRoute(point: newPoint)
            
        default:
            print("Opción no válida")
        }
    }
    
}


