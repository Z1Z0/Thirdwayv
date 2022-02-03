//
//  EndPoint.swift
//  TestAnyThing
//
//  Created by Ahmed Abd Elaziz on 30/01/2022.
//

import Foundation

protocol EndPoint {
    
    var scheme: String { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: String { get }
}
