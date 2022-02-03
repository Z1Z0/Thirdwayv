//
//  NetworkManager.swift
//  TestAnyThing
//
//  Created by Ahmed Abd Elaziz on 30/01/2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    class func request<T: Codable>(endPoint: EndPoint, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.baseURL
        
        guard let url = components.url else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unkown error")
                return
            }
            
            guard response != nil, let data = data else {return}
            
            DispatchQueue.main.async {
                if let resposeObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(resposeObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
