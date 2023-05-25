//
//  MealsRepositoryProtocol.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


// COMMENT #1: Here I'm using a design pattern called Repository which is a software design pattern that provides an abstraction of data, so that your application can work with a simple abstraction that has an interface. Using this pattern can help achieve loose coupling and can keep domain objects persistence ignorant.

// COMMENT #2: Using the (url & isMocking) params for unit testing purposes to be able to pass either the server url or local file path url.

protocol MealsRepository {
    func fetchPopulatedMeals(completion: @escaping (_ error: String?, _ mealsArr: [Meal]?) -> Void)
    func fetchMeals(from url: URL, isMocking: Bool, completion: @escaping (_ error: String?, _ mealsArr: [Meal]?) -> Void)
    func fetchPopulatedMealDetails(id: String, completion: @escaping (_ error: String?, _ mealsArr: MealDetails?) -> Void)
    func fetchMealDetails(id: String, from url: URL, isMocking: Bool, completion: @escaping (_ error: String?, _ mealsArr: MealDetails?) -> Void)
}
