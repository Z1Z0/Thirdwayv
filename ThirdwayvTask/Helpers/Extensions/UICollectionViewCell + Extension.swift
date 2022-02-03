//
//  UICollectionViewCell + Extension.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        self.register(Cell.self, forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Can't dequeue cell")
        }
        
        return cell
    }
}
