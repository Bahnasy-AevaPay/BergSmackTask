//
//  MealsListViewModel.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation

protocol MealsListNavigation: AnyObject {
    func goToDetailsScreen(of id: String)
}

class MealsListVM {
    // MARK:- Properties
    weak var coordinator: AppCoordinator?
    let mealsAPIManager: MealsRepository
    private var mealsArr: [Meal] = [Meal]()
    var selectedMeal: Meal!
    
    // MARK:- Init
    init(with mealsAPIManager: MealsRepository) {
        self.mealsAPIManager = mealsAPIManager
    }
}


// MARK:- API Calls Methods
extension MealsListVM {
    func initFetchMealsList() {
        mealsAPIManager.fetchPopulatedMeals { [weak self] (error, mealsArr) in
            guard let self = self else {return}
            if let error = error {
                print(error)
            } else if let mealsArr = mealsArr {
                print(mealsArr)
            }
        }
    }
}
// MARK:- Helper Methods
extension MealsListVM {
    func userTapped(at indexPath: IndexPath) {
        selectedMeal = self.mealsArr[indexPath.row]
        coordinator?.goToDetailsScreen(of: selectedMeal.idMeal ?? "")
    }
}
