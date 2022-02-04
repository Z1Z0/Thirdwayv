//
//  DumbData.swift
//  TestAnyThing
//
//  Created by Ahmed Abd Elaziz on 29/01/2022.
//

import Foundation

struct Products: Codable {
    let id: Int?
    let productDescription: String?
    let image: ProductsImage
    let price: Int?
}


struct ProductsImage: Codable {
    
    let width, height: Int?
    let url: String?
}
