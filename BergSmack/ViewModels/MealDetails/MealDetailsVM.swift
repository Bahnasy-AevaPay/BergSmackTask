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

protocol MealDetailsVMProtocol{
    func initFetchMealDetails()
    func finishPreviewingDetails()
}

class MealDetailsVM: MealDetailsVMProtocol {
    
    
    // MARK: Properties
    weak var coordinator: MealDetailsCoordinator?//weak to avoid memory leak
    weak private var view: MealDetailsVCProtocol?
    let mealsAPIManager: MealsRepository
    var id: String!
    private var array: [String] = []
    
    // MARK: Init
    init(with id: String, mealsAPIManager: MealsRepository, view: MealDetailsVCProtocol) {
        self.id = id
        self.mealsAPIManager = mealsAPIManager
        self.view = view
    }
}

// MARK:- API Calls Methods
extension MealDetailsVM {
    func initFetchMealDetails() {
        self.view?.showLoader()
        mealsAPIManager.fetchPopulatedMealDetails(id: id) { [weak self] (error, mealDetails) in
            guard let self = self else {return}
            if let error = error {
                print(error)
            } else if let mealDetails = mealDetails {
                var array : [String] = []
                //here we appennd the igredient then measure to be shown as "Ingrediennt/Measurment"
                array.append(mealDetails.strIngredient1 ?? "")
                array.append(mealDetails.strMeasure1 ?? "")
                
                array.append(mealDetails.strIngredient2 ?? "")
                array.append(mealDetails.strMeasure2 ?? "")
                
                array.append(mealDetails.strIngredient3 ?? "")
                array.append(mealDetails.strMeasure3 ?? "")
                
                array.append(mealDetails.strIngredient4 ?? "")
                array.append(mealDetails.strMeasure4 ?? "")
                
                array.append(mealDetails.strIngredient5 ?? "")
                array.append(mealDetails.strMeasure5 ?? "")
                
                array.append(mealDetails.strIngredient6 ?? "")
                array.append(mealDetails.strMeasure6 ?? "")
                
                array.append(mealDetails.strIngredient7 ?? "")
                array.append(mealDetails.strMeasure7 ?? "")
                
                array.append(mealDetails.strIngredient8 ?? "")
                array.append(mealDetails.strMeasure8 ?? "")
                
                array.append(mealDetails.strIngredient9 ?? "")
                array.append(mealDetails.strMeasure9 ?? "")
                
                array.append(mealDetails.strIngredient10 ?? "")
                array.append(mealDetails.strMeasure10 ?? "")
                
                array.append(mealDetails.strIngredient11 ?? "")
                array.append(mealDetails.strMeasure11 ?? "")
                
                array.append(mealDetails.strIngredient12 ?? "")
                array.append(mealDetails.strMeasure12 ?? "")
                
                array.append(mealDetails.strIngredient13 ?? "")
                array.append(mealDetails.strMeasure13 ?? "")
                
                array.append(mealDetails.strIngredient14 ?? "")
                array.append(mealDetails.strMeasure14 ?? "")
                
                array.append(mealDetails.strIngredient15 ?? "")
                array.append(mealDetails.strMeasure15 ?? "")
                
                array.append(mealDetails.strIngredient16 ?? "")
                array.append(mealDetails.strMeasure16 ?? "")
                
                array.append(mealDetails.strIngredient17 ?? "")
                array.append(mealDetails.strMeasure17 ?? "")
                
                array.append(mealDetails.strIngredient18 ?? "")
                array.append(mealDetails.strMeasure18 ?? "")
                
                array.append(mealDetails.strIngredient19 ?? "")
                array.append(mealDetails.strMeasure19 ?? "")
                
                array.append(mealDetails.strIngredient20 ?? "")
                array.append(mealDetails.strMeasure20 ?? "")
                // remove all empty strings from the array
                self.array = array.filter{$0 != "" && $0 != " "}
                // here make each 2 iteams separate with / for ingredietns and measures
                let ingredientAndMeasure = self.array.enumerated().map { "\($0.element) \($0.offset % 2 == 1 ? "\n" : "/ ")" }.joined()
                self.view?.setup(image: mealDetails.strMealThumb ?? "", name: mealDetails.strMeal ?? "", instructions:  mealDetails.strInstructions ?? "", ingreadients: ingredientAndMeasure)
            }
            self.view?.hideLoader()
        }
    }
}


// MARK: Helper Methods
extension MealDetailsVM {
    func finishPreviewingDetails() {
        coordinator?.didFinishPreviewing()
    }
}
