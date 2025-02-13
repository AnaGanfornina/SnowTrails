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
    func executeAction(option: Int) -> Void {
        switch option {
        case 1:
           
            let users = UserServices().viewAllUsers(fromData: userRepository)
            // Imprimir usuarios // TODO: Ver el formato en el que se imprime
            for item in users { // TODO: Prueba a mejorar el switch con u let en cada caso
                switch item {
                case is AdminUser:
                    let rol = "Admin"
                    print("\(rol): \(item.name) --- Email: \(item.mail)")
                case is RegularUser:
                    let rol = "Regular User"
                    print("\(rol): \(item.name) --- Email: \(item.mail)")
                default:
                    let rol = "Desconocido"
                    print("\(rol): \(item.name) --- Email: \(item.mail)")
                }
                
            }
        case 2:
            print("Añadir usuario")
            //Pedir usuario
            
            print("Introduce el nombre del usuario que quieres añadir: ")
            let name = UserChoiceController().readUserChoice()
            
            print("Introduce el email del usuario que quieres añadir: ")
            let mail = UserChoiceController().readUserChoice()
            
            print("Introduce la contrase~na del usuario que quieres añadir: ")
            let password = UserChoiceController().readUserChoice()
            
            let newUser = RegularUser(name: name, mail: mail, password: password)
            
            UserServices().appendUser(newUser, fromData: userRepository)
            
        case 3:
            print("Eliminar usuario")
            // Pedir usuario
            print("Introduzca el nombre del usuario:")
            
            let name = UserChoiceController().readUserChoice()
            
            UserServices().deleteUser(name, fromData: userRepository)
            
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


