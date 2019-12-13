//
//  NetworkProvider.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation

let serverUrl = "http://ec2-18-188-241-65.us-east-2.compute.amazonaws.com:8080"

enum NetworkTarget {
    case fetchOffers
}
extension NetworkTarget {
    private var baseURL: String {
        return serverUrl
    }
    private var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    private var path: String {
        switch self {
        case .fetchOffers:
            return "/packet/list"
        }
    }
    private var parameters: [String: Any] {
        switch self {
        case .fetchOffers:
            return [:]
        }
    }
}
extension NetworkTarget {
    
    func call<T: Decodable>(completion:@escaping (T?) -> (), failureCompletion:@escaping (String)-> Void) {
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: generateUrl())
        
        if let headerKeys = self.headers {
            for (key, value) in headerKeys {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        session.dataTask(with: request) { (data, response, error) in
            do {
                if let currentData = data {
                    let parsedData = try JSONDecoder().decode(T.self, from: currentData)
                    debugPrint(parsedData)
                    completion(parsedData)
                }
            }
            catch let err {
                debugPrint(err)
                completion(nil)
            }
        }.resume()
    }

    private func generateUrl() -> URL {
        if let url = URL(string: baseURL.appending(self.path)) {
            return url
        }
        return URL(string: "")!
    }
}
