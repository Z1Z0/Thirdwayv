//
//  ProductDetailsViewController.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        layoutUI()
        receiveProductData()
    }
    
    var images: String?
    var prices: Int?
    var titles: String?
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private func setupProductImageConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 3)
        ])
    }
    
    private lazy var productPrice: UILabel = {
        let price = UILabel()
        price.textColor = .systemBlue
        price.textAlignment = .center
        price.font = .systemFont(ofSize: 17.0, weight: .semibold)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    private func setupProductPriceConstraints() {
        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 16),
            productPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private lazy var productTitle: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private func setupProductTitleConstraints() {
        NSLayoutConstraint.activate([
            productTitle.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 16),
            productTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func addSubviews() {
        view.addSubview(productImage)
        view.addSubview(productPrice)
        view.addSubview(productTitle)
    }
    
    private func setupConstraints() {
        setupProductImageConstraints()
        setupProductPriceConstraints()
        setupProductTitleConstraints()
    }
    
    private func layoutUI() {
        addSubviews()
        setupConstraints()
    }
    
    private func receiveProductData() {
        if let images = URL(string: images ?? "") {
            productImage.load(url: images)
        }
        if let prices = prices {
            productPrice.text = "$" + String(describing: prices)
        }
        
        if let titles = titles {
            productTitle.text = titles
        }
    }
    
    func config(_ productsData: Products) {
        images = productsData.image.url
        prices = productsData.price
        titles = productsData.productDescription
    }

}
