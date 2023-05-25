//
//  MealsAPIManager.swift
//  BergSmack
//
//  Created by Bahnasy on 25/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


class MealsAPIManager: MealsRepository {
    func fetchPopulatedMeals(completion: @escaping (String?, [Meal]?) -> Void) {
        guard let url = URL(string: Urls.base) else {
            completion(NetworkError.notValidUrl, nil)
            return
        }
        
        fetchMeals(from: url, isMocking: false, completion: completion)
    }
    
    func fetchMeals(from url: URL, isMocking: Bool, completion: @escaping (String?, [Meal]?) -> Void) {
        let provider = ServiceProvider<MealsService>()
        
        provider.load(service: .getListOfMeals(url: url, isMocking: isMocking), decodeType: MealsListBaseReponse.self) { (result) in
            
            switch result {
            case .success(let response):
                guard let items = response.meals else {return}
                completion(nil, items)
            case .failure(let error):
                print(error.localizedDescription)
                completion(error.localizedDescription, nil)
            case .empty:
                completion(NetworkError.noReturnedData, nil)
            }
        }
    }
    
    func fetchPopulatedMealDetails(id: String, completion: @escaping (String?, MealDetails?) -> Void) {
        guard let url = URL(string: Urls.base) else {
            completion(NetworkError.notValidUrl, nil)
            return
        }
        
        fetchMealDetails(id: id, from: url, isMocking: false, completion: completion)
    }
    
    func fetchMealDetails(id: String, from url: URL, isMocking: Bool, completion: @escaping (String?, MealDetails?) -> Void) {
        let provider = ServiceProvider<MealsService>()
        
        provider.load(service: .getMealDetails(url: url, isMocking: isMocking, id: id), decodeType: MealDetailsBaseReponse.self) { (result) in
            
            switch result {
            case .success(let response):
                guard let details = response.meals?.first else {return}
                completion(nil, details)
            case .failure(let error):
                print(error.localizedDescription)
                completion(error.localizedDescription, nil)
            case .empty:
                completion(NetworkError.noReturnedData, nil)
            }
        }
    }
}
