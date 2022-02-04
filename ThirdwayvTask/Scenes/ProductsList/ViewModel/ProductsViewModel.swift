//
//  ProductsViewModel.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import Foundation
import UIKit

class ProductsViewModel {
    
    weak var dataSource : GenericDataSource<Products>?
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(dataSource : GenericDataSource<Products>?) {
        self.dataSource = dataSource
    }
    
    func fetchDataFromAPI() {
        NetworkManager.request(endPoint: ProductsEndPoint.getProductsDetails) { (result: Result<[Products], Error>) in
            switch result {
            case .success(let result):
                self.dataSource?.data.value.append(contentsOf: result)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var product: [Product]?
    
    func fetchDataFromCache() {
        do {
            self.product = try context.fetch(Product.fetchRequest())
            
        } catch {
            print(error)
        }
    }
}
