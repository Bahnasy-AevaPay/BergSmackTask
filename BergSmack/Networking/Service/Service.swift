//
//  Service.swift
//  BergSmack
//
//  Created by Bahnasy on 24/05/2023.
//  Copyright © 2023 Joshua Williams. All rights reserved.
//

import Foundation


enum ServiceMethod: String {
    case get = "GET"
}

protocol Service {
    var baseURL: URL {get}
    var path: String? {get}
    var parameters: [String: Any]? {get}
    var headers: [String: String]? {get}
    var method: ServiceMethod {get}
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError(NetworkError.notValidUrl)
        }
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.httpMethod = method.rawValue
        
        return request
    }
    
    private var url: URL? {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        if let path = path {
            urlComponents?.path = path
        }
        
        if method == .get && parameters != nil {
            guard let parameters = parameters as? [String: String] else {
                fatalError(NetworkError.paramNotStrings)
            }
            
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
        }
        
        return urlComponents?.url
    }
}
