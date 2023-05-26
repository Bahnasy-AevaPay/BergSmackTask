//
//  ServiceProvider.swift
//  BergSmack
//
//  Created by Bahnasy on 24/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


enum Result<T> {
    case success(T)
    case failure(Error)
    case empty
}

class ServiceProvider<T: Service> {
    var urlSession = URLSession.shared
    
    init() {}
    
    func load(service: T, completion: @escaping (Result<Data>) -> Void) {
        call(service.urlRequest, completion: completion)
    }
    
    func load<U>(service: T, decodeType: U.Type, completion: @escaping (Result<U>) -> Void) where U: Decodable {
        call(service.urlRequest) { (result) in
            switch result {
            case.success(let data):
                let decoder = JSONDecoder()
                do {
                    let response =  try decoder.decode(decodeType, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            case .empty:
                completion(.empty)
            }
        }
    }
}

extension ServiceProvider {
    private func call(_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data>) -> Void) {
        
        urlSession.dataTask(with: request) { (data, _, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                deliverQueue.async {
                    completion(.success(data))
                }
            } else {
                deliverQueue.async {
                    completion(.empty)
                }
            }
        }.resume()
    }
}
