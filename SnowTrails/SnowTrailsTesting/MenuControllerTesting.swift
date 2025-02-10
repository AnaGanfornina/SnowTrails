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
        var user: User?
        
        
        init() {
            self.menuLogin = LoginMenuController()
        }

        @Test func inputAdminUserMailAndPassword_ThenReturn1() {
            let userImput = ("adminuser@keepcoding.es", "Adminuser1") //Falseo de la función
            
            
            do {
                user = try menuLogin.login(mailAndPasword: userImput)
            }catch {
                return
            }
            
            #expect(user is AdminUser, "Se espera que devuelva un tipo AdminUser")
        }
        @Test func inputRegularUserMailAndPassword_ThenReturn1()  {
            let userImput = ("regularuser@keepcoding.es", "Regularuser1") //Falseo de la función
            
            do {
                user = try menuLogin.login(mailAndPasword: userImput)
            }catch {
                return
            }
            #expect(user is RegularUser, "Se espera que devuelva un tipo AdminUser")
        }
    }
}
