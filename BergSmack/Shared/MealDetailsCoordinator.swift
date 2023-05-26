//
//  MealDetailsCoordinator.swift
//  BergSmack
//
//  Created by Bahnasy on 24/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation
import UIKit

class MealDetailsCoordinator: Coordinator {
    // MARK:- Properties
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    // MARK:- Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Started")
    }
}

//MARK:- ArticlesDetailsNavigation
extension MealDetailsCoordinator: MealDetailsNavigation {
    func didFinishPreviewing() {
        parentCoordinator?.childDidFinish(self)
    }
}

// MARK:- Helper Methods
extension MealDetailsCoordinator {
    func start(with id: String) {
        let mealDetailsVC: MealDetailsVC = UIViewController.create(storyboardName: StoryBoards.main, identifier: VCs.mealDetailsVC)
        let mealDetailsVM = MealDetailsVM(with: id, mealsAPIManager: MealsAPIManager(), view: mealDetailsVC)
        mealDetailsVC.viewModel = mealDetailsVM
        mealDetailsVM.coordinator = self
        self.navigationController.pushViewController(mealDetailsVC, animated: true)
    }
}
