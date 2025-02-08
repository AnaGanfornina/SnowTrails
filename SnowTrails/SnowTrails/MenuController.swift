//
//  MenuController.swift
//  SnowTrails
//
//  Created by Ismael Sabri Pérez on 6/2/25.
//

import Foundation

class MenuController {
    
    func showLoginMenu() {
        print("Login menu. The number of menus in this app is \(getNumberOfMenus())")
    }
    
    func getNumberOfMenus() -> Int {
        return 3
    }
}
