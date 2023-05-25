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
        
        
//        apiManager.fetchPopulatedMealDetails(id: "52917") { [weak self] (error, mealDetails) in
//            guard let self = self else {return}
//            if let error = error {
//                print(error)
//            } else if let mealDetails = mealDetails {
//                print(mealDetails)
//            }
//        }
        var appCoordinator: AppCoordinatorStarter?

        
        let naviagtionController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: naviagtionController)
        appCoordinator?.start()
        
        window?.rootViewController = naviagtionController
        window?.makeKeyAndVisible()

        return true
    }

}

