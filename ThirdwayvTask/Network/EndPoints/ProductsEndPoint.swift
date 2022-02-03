//
//  ProductsEndPoint.swift
//  TestAnyThing
//
//  Created by Ahmed Abd Elaziz on 30/01/2022.
//

import Foundation

enum ProductsEndPoint: EndPoint {
    
    case getProductsDetails
    
    var scheme: String {
        switch self {
        default:
            return "HTTPS"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "thirdwayv.free.beeceptor.com"
        }
    }
    
    var path: String {
        switch self {
        case .getProductsDetails:
            return ""
        }
    }
    
    var method: String {
        switch self {
        case .getProductsDetails:
            return "GET"
        }
    }
    
    
}
