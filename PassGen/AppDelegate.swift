//
//  AppDelegate.swift
//  PassGen
//
//  Created by Maxime LE COAT on 12/29/18
//  Copyright (c) 2018 Maximelc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setup()
        
        return true
    }
}

// MARK: - Setup
extension AppDelegate {

    private func setup() {
        /* Logger */
        PGLogger.setup()
    }
}
