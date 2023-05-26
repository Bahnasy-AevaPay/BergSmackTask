//
//  Constants.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


struct StoryBoards {
    static let main = "Main"
}

// ViewControllers
struct VCs {
    static let mealsListVC = "MealsListVC"
    static let mealDetailsVC = "MealDetailsVC"
}

struct Cells {
    static let mealsCell = "MealTableViewCell"
}

struct NetworkError {
    static let notValidUrl = "URL Couldn't be built"
    static let paramNotStrings = "Parameters for GET http method must conform to [String: String]"
    static let noReturnedData = "There is no data returned form the server"
}


struct Urls {
    static let base = "https://themealdb.com"
    static let mealsList = "/api/json/v1/1/filter.php"
    static let mealDetails = "/api/json/v1/1/lookup.php"
}


struct APIParamKeys {
    static let category = "c"
    static let id = "i"
}

struct APIParamValues {
    static let dessert = "Dessert"
}

