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

protocol MealsListVMProtocol{
    func initFetchMealsList()
    func didTapCell(at indexPath: IndexPath)
    func getItemsCount()-> Int
    func configureMealCell(cell: MealTableViewCell, index: Int)
}

class MealsListVM {
    // MARK: Properties
    weak var coordinator: MealsListNavigation?
    weak private var view: MealsListVCProtocol?
    let mealsAPIManager: MealsRepository
    private var mealsArr: [Meal] = [Meal]()
    var selectedMeal: Meal!
    
    // MARK:- Init
    init(with mealsAPIManager: MealsRepository, view: MealsListVCProtocol) {
        self.mealsAPIManager = mealsAPIManager
        self.view = view
    }
}


// MARK:- API Calls Methods
extension MealsListVM {
    func initFetchMealsList() {
        self.view?.showLoader()
        mealsAPIManager.fetchPopulatedMeals { [weak self] (error, mealsArr) in
            guard let self = self else {return}
            if let error = error {
                print(error)
            } else if let mealsArr = mealsArr {
                self.mealsArr = mealsArr.filter { $0.idMeal != "" && $0.idMeal != nil }
                self.view?.reloadTableView()
            }
            self.view?.hideLoader()
        }
    }
}
//MARK: ViewModel to View
extension MealsListVM: MealsListVMProtocol{
    func didTapCell(at indexPath: IndexPath) {
        self.userTapped(at: indexPath)
    }
    
    func getItemsCount() -> Int {
        return self.mealsArr.count
    }
    
    func configureMealCell(cell: MealTableViewCell, index: Int) {
        if !self.mealsArr.isEmpty{
            cell.bind(meal: self.mealsArr[index])
        }
    }
    
    
}
// MARK: - Helper Methods
extension MealsListVM {
    func userTapped(at indexPath: IndexPath) {
        selectedMeal = self.mealsArr[indexPath.row]
            coordinator?.goToDetailsScreen(of: selectedMeal.idMeal ?? "")
    }
}
