//
//  FoodManager.swift
//  BergSmack
//
//  Created by Joshua Williams on 5/22/23.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


protocol FoodManagerDelegate {
    func didGrabFoodData(_ foodManager: FoodManager, meals: [MealDessertModel]?)
    func didFailWithError(error: Error)
}


struct FoodManager {
    let foodDessertUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    var delegate: FoodManagerDelegate?
    
    func getDessertFood() {
        print(foodDessertUrl)
        performRequest(with: foodDessertUrl)
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
//                    print(error)
                    return
                }
                if let safeData = data {
                    if let meals = self.parseJSON(safeData) {
                        self.delegate?.didGrabFoodData(self, meals: meals)
                    }
                }
            }
            task.resume()
        }
    }
        
//        func parseJSON(_ foodData: Data) -> MealDessertModel? {
//            let decoder = JSONDecoder()
//            do {
//                var newArr: Array<Any> = []
//                var newMeal: MealDessertModel?
//
//                let decodedData = try decoder.decode(FoodDessertData.self, from: foodData)
////                let mealName = decodedData.meals[0].strMeal
////                let mealPicture = decodedData.meals[0].strMealThumb
////                let mealID = decodedData.meals[0].idMeal
////
////                let meals = MealDessertModel(meal: mealName, mealPic: mealPicture, idmeal: mealID)
//
//                if let allMeals = decodedData.meals
////                    let photos = allMeals as? [Meals]
//                {
//                    for object in allMeals {
//                        let id = object.idMeal
//                        let mealName = object.strMeal
//                        let mealPicture = object.strMealThumb
//
//                        newMeal = MealDessertModel(meal: mealName, mealPic: mealPicture, idmeal: id)
//                        newArr.append(newMeal)
//
////                        print(newMeal)
//
//                    }
//
//                }
//                print(newArr)
//                print(newMeal)
//
//
//                return newMeal
//
//            } catch {
//                delegate?.didFailWithError(error: error)
//                print(error)
//                return nil
//            }
//        }
    
    
    
    
    
    
    /// new method
    
            func parseJSON(_ foodData: Data) -> [MealDessertModel]? {
                let decoder = JSONDecoder()
       
                    var newArr: Array<Any> = []
                    var newMeals: [MealDessertModel]? = [MealDessertModel]()
                 
                    let decodedData = try! decoder.decode(MealsListBaseReponse.self, from: foodData)
                    
                    
                let dataArray = decodedData.meals!
                    for item in dataArray {
                        
                        
                        
                        
                        let mealID = item.idMeal!
                        let mealName = item.strMeal!
                        let mealPicture = item.strMealThumb!
                        
                        
                        
                       
                        
                        let meal = MealDessertModel(meal: mealName, mealPic: mealPicture, idmeal: mealID)
//                        print(meals)
//                        return meals
                        newMeals?.append(meal)
//                        print(meals)
                    }
                    
                    
                    
    //                let mealName = decodedData.meals[0].strMeal
    //                let mealPicture = decodedData.meals[0].strMealThumb
    //                let mealID = decodedData.meals[0].idMeal
    //
    //                let meals = MealDessertModel(meal: mealName, mealPic: mealPicture, idmeal: mealID)


//                    print(newArr)
                    print(newMeals)

                    
                    return newMeals
     
    
            }
    
    
        
    
}



