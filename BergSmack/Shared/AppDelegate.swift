//
//  AppDelegate.swift
//  BergSmack
//
//  Created by Joshua Williams on 5/22/23.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var appCoordinator: AppCoordinatorStarter?
        
        let navigationController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}

