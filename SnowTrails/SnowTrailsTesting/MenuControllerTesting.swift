//
//  Test.swift
//  SnowTrailsTesting
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Testing

class MenuControllerTesting {
    
    @Suite("Number of menus")
    class NumberOfMenusTests {
        
        var menuController: MenuController?
        
        init() {
            menuController = MenuController()
        }
        
        deinit {
            menuController = nil
        }
        
        @Test func whenCalled_return3() async throws {
            #expect(menuController!.getNumberOfMenus() == 3, "The number of menus is not 3")
        }
    }
}
