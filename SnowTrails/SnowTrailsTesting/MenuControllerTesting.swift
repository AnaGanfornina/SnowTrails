//
//  Test.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing

class MenuControllerTesting {
    
    @Suite("login")
    class LoginTests {
        
        let menuLogin: LoginMenuController
        
        
        init() {
            self.menuLogin = LoginMenuController()
        }

        @Test func inputAdminUserMailAndPassword_ThenReturn1() {
            let userImput = ("adminuser@keepcoding.es", "Adminuser1") //Falseo de la función
            
            #expect(menuLogin.login(mailAndPasword: userImput) is AdminUser, "Se espera que devuelva un tipo AdminUser")
        }
        @Test func inputRegularUserMailAndPassword_ThenReturn1() {
            let userImput = ("regularuser@keepcoding.es", "Regularuser1") //Falseo de la función
            
            #expect(menuLogin.login(mailAndPasword: userImput) is RegularUser, "Se espera que devuelva un tipo AdminUser")
        }
    }
}
