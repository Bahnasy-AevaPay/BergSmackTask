//
//  MealDetailsViewModel.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation

protocol MealDetailsNavigation: AnyObject {
    func didFinishPreviewing()
}

class MealDetailsVM {
    // MARK:- Properties
    weak var coordinator: MealDetailsCoordinator?
    let mealsAPIManager: MealsRepository
    var id: String!

    
    // MARK:- Init
    init(with id: String, mealsAPIManager: MealsRepository) {
        self.id = id
        self.mealsAPIManager = mealsAPIManager
    }
}

// MARK:- API Calls Methods
extension MealDetailsVM {
    func initFetchMealDetails() {
        mealsAPIManager.fetchPopulatedMealDetails(id: id) { [weak self] (error, mealDetails) in
            guard let self = self else {return}
            if let error = error {
                print(error)
            } else if let mealDetails = mealDetails {
                print(mealDetails)
            }
        }
    }
}


// MARK:- Helper Methods
extension MealDetailsVM {
    func finishPreviewingDetails() {
        coordinator?.didFinishPreviewing()
    }
}
