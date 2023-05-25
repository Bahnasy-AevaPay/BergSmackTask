//
//  FoodDessertData.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


// COMMENT #1: All model fields should be optional to avoid the not retrieved data issues.

// COMMENT #2: Codable protocol has two protocols (Decodable & Encodable) When you're concerned with to parsing the JSON you don't have to conform Encodable which is conformed by default while Codable conformance so in this case conform only Decodable protocol.

// COMMENT #3: When it comes to models naming, let's follow the naming conventions by making the model name Single not plural (Meal not Meals) and replace the data word with response (FoodDessertResponse not FoodDessertData)

struct MealsListBaseReponse: Decodable {
    let meals: [Meal]?
}

struct Meal: Codable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
}

