//
//  AppCoordinator.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation
import UIKit

// COMMENT #1: Here I'm using a design pattern called Coordinator which is a software design pattern that provides you with following ability: Instead of pushing and presenting your ViewControllers from other view controllers. All the screens navigation will be managed by coordinatos.

protocol AppCoordinatorStarter {
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

//MARK:- AppCoordinatorStarter
extension AppCoordinator: AppCoordinatorStarter {
    func start() {
        goToMealListScreen()
    }
}

//MARK:- MealsListNavigation
extension AppCoordinator: MealsListNavigation {
    func goToDetailsScreen(of id: String) {
        goToMealDetailsScreen(with: id)
    }
}

extension AppCoordinator {
    private func goToMealListScreen() {
        let mealsListVC: MealsListVC = UIViewController.create(storyboardName: StoryBoards.main, identifier: VCs.mealsListVC)
        let mealsListVM = MealsListVM(with: MealsAPIManager(), view: mealsListVC)
        mealsListVC.viewModel = mealsListVM
        mealsListVM.coordinator = self
        // Append the Coordinator object to the childCoordinators array
        childCoordinators.append(self)
        self.navigationController.pushViewController(mealsListVC, animated: true)
    }
    
    private func goToMealDetailsScreen(with id: String) {
        let child = MealDetailsCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start(with: id)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
