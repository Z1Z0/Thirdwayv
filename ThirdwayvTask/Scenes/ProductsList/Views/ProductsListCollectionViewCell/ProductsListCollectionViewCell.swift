//
//  ProductsCollectionViewCell.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import UIKit

class ProductsListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 6
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImage.image = nil
    }
    
    func config(_ data: Products) {
        let cache = CacheManager()
        let product = data
        if let imageURL = URL(string: product.image.url ?? ""), let productDescription = product.productDescription, let price = product.price {
            
            productTitle.text = productDescription
            productPrice.text = "$" + String(describing: price)
            productImage.load(url: imageURL)
            if let imageData = productImage.image?.pngData() {
                
                cache.cacheProducts(productDescription, price, imageData)
            }
        }
    }
    
}
