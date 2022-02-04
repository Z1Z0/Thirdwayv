//
//  ProductListViewController.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    let dataSource = ProductsListDataSource()
    let reachability = try! Reachability()
    
    lazy var viewModel: ProductsViewModel = {
        let viewModel = ProductsViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.productsListViewController = self
        layoutUI()
        
        dataSource.pushViewControllerDelegate = self
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.productsListCollectionView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
            do {
                try reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability

        if reachability.connection != .unavailable {
            viewModel.fetchDataFromAPI()
        } else {
            viewModel.fetchDataFromCache()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    lazy var productsListCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let productsList = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        productsList.registerCell(cellClass: ProductsListCollectionViewCell.self)
        productsList.dataSource = dataSource
        productsList.delegate = dataSource
        productsList.showsVerticalScrollIndicator = false
        productsList.backgroundColor = .white
        productsList.translatesAutoresizingMaskIntoConstraints = false
        return productsList
    }()
    
    private func setupProductsListCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            productsListCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            productsListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            productsListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func addSubViews() {
        view.addSubview(productsListCollectionView)
    }
    
    private func setupConstraints() {
        setupProductsListCollectionViewConstraints()
    }
    
    private func layoutUI() {
        addSubViews()
        setupConstraints()
    }
}

extension ProductsListViewController: PushNewViewControllerDelegate {
    
    func push(indexPath: Int) {
        let productDetails = ProductDetailsViewController()
        productDetails.config(dataSource.data.value[indexPath])
        self.show(productDetails, sender: nil)
    }
    
}
