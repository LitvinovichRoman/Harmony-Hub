//
//  CategoryDetailView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit

protocol CategoryDetailViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    var imageView: UIImageView { get set }
}

class CategoryDetailView: BaseAppView, CategoryDetailViewProtocol {
    //MARK: -- Presenter
    var presenter: CategotyDetailViewPresenterProtocol!
    
    //MARK: -- Properties[View]
    lazy var subView: UIView = {
        $0.layer.borderColor = Resources.Colors.App.borderColor.cgColor
        $0.layer.borderWidth = CategoryDetailViewConstants.borderWidth
        $0.backgroundColor = Resources.Colors.App.accent
        $0.layer.cornerRadius = CategoryDetailViewConstants.cornerRadius
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    //MARK: -- Properties[ImageView]
    lazy var imageView: UIImageView = {
        $0.layer.cornerRadius = CategoryDetailViewConstants.cornerRadius
        $0.layer.masksToBounds = true
        return $0
    }(UIImageView())
    
    //MARK: -- Properties[Label]
    lazy var centerLabel: UILabel = {
        $0.text = Resources.Strings.MainScreen.posesTitle
        $0.backgroundColor = CategoryDetailViewConstants.labelBacgroundColor
        $0.font = CategoryDetailViewConstants.labelFont
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    //MARK: -- Properties[collectionView]
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CollectionCellConstants.itemSize
        layout.sectionInset = CollectionCellConstants.sectionInset
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CategoryDetailViewConstants.cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    var imageUrl: URL? { didSet { if let imageUrl = imageUrl { imageView.loadImage(from: imageUrl) } } }
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        configureBackground(with: Resources.Backgrounds.main)
        presenter.loadImageURLs()
        configureLayout ()
    }
}

//MARK: - DataSource & DelegateFlowLayout Methods
extension CategoryDetailView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailViewConstants.cellIdentifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        let imageURL = presenter.imageURL(at: indexPath.item)
        cell.configure(with: imageURL)
        return cell
    }
}


//MARK: - Configure Layout
extension CategoryDetailView {
    func configureLayout () {
        contentImage.addSubviews(subView, centerLabel, collectionView)
        subView.addSubviews(imageView)
        makeSubViewConstraints()
        makeImageViewConstraints()
        makeCenterLabelConstraints()
        makeCollectionViewConstraints()
    }
    
    
    func makeSubViewConstraints() {
        NSLayoutConstraint.activate([
            subView.heightAnchor.constraint(equalToConstant: CategoryDetailViewConstants.subViewHeightAnchor),
            subView.widthAnchor.constraint(equalToConstant: CategoryDetailViewConstants.subViewWidthAnchor),
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CategoryDetailViewConstants.subViewTopAnchor),
            subView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func makeImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: CategoryDetailViewConstants.imageViewHeightAnchor),
            imageView.widthAnchor.constraint(equalToConstant: CategoryDetailViewConstants.imageViewWidthAnchor),
            imageView.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: subView.centerYAnchor),
        ])
    }
    
    func makeCenterLabelConstraints() {
        NSLayoutConstraint.activate([
            centerLabel.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: CategoryDetailViewConstants.centerLabelTopAnchor),
            centerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CategoryDetailViewConstants.leadingAnchor),
            centerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CategoryDetailViewConstants.trailingAnchor),
        ])
    }
    
    func makeCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: centerLabel.bottomAnchor, constant: CategoryDetailViewConstants.leadingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CategoryDetailViewConstants.bottomAnchor),
        ])
    }
    
    
}


