//
//  MealsService.swift
//  BergSmack
//
//  Created by Bahnasy on 24/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


enum MealsService {
    case getListOfMeals(url: URL, isMocking: Bool)
    case getMealDetails(url: URL, isMocking: Bool, id: String)
}

extension MealsService: Service {
    var baseURL: URL {
        switch self {
        case .getListOfMeals(let url, _):
            return url
        case .getMealDetails(let url, _, _):
            return url
        }
    }
    
    var path: String? {
        switch self {
        case .getListOfMeals(_, let isMocking):
            return isMocking ? nil : Urls.mealsList
        case .getMealDetails(_, let isMocking, _):
            return isMocking ? nil : Urls.mealDetails
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getListOfMeals:
            return  [APIParamKeys.category: APIParamValues.dessert]
        case .getMealDetails(_, _, let id):
            return [APIParamKeys.id: id]
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getListOfMeals, .getMealDetails:
            return nil
        }
    }
    
    var method: ServiceMethod {
        switch self {
        case .getListOfMeals, .getMealDetails:
            return .get
        }
    }
    
}
