//
//  CacheManager.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 04/02/2022.
//

import Foundation
import CoreData
import UIKit

class CacheManager {
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func cacheProducts(_ title: String, _ price: Int, _ image: Data) {
        let product = Product(context: context)
        product.title = title
        product.price = Int16(price)
        product.image = image
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
