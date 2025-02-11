//
//  UserChoiceControllerTesting.swift
//  SnowTrailsTesting
//
//  Created by Ana on 11/2/25.
//

import Testing

class UserChoiceControllerTesting {
    @Suite("isExit")
    class IsExitTests {
        let instance: UserChoiceController
        init() {
            self.instance = UserChoiceController()
        }
        
    
        @Test func inputIs3UserMenuController_ReturTrue() {
            let menu = UserMenuController()
            let userChoice = "3"
            #expect(instance.isExit(input: userChoice, menu: menu) == true , "Se espera que devuelva true, por lo que debería salise del bucle")
        }
        
        @Test func inputIs3MenuController_ReturTrue() {
            let menu = MenuController()
            let userChoice = "3"
            #expect(instance.isExit(input: userChoice, menu: menu) == true , "Se espera que devuelva true, por lo que debería salise del bucle")
        }
        @Test func inputIs5AdminMenuController_ReturTrue() {
            let repositoryExample = UsersLoader(fromData: UserData())
            let menu = AdminMenuController(whithRepository: repositoryExample)
            let userChoice = "5"
            #expect(instance.isExit(input: userChoice, menu: menu) == true , "Se espera que devuelva true, por lo que debería salise del bucle")
        }
        @Test func inputIs1UserMenuController_ReturFalse() {
            let menu = UserMenuController()
            let userChoice = "1"
            #expect(instance.isExit(input: userChoice, menu: menu) == false , "Se espera que devuelva false, por lo que debería continuar en bucle")
        }
    }

    

}
