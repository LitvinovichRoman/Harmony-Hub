//
//  CategoryDetailView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit

// MARK: - CategoryDetailView Protocol
protocol CategoryDetailViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    var imageView: UIImageView { get set }
}

// MARK: - FInal Class CategoryDetailView
final class CategoryDetailView: UIViewController, Backgroundable, CategoryDetailViewProtocol {
    //MARK: -- Properties
    var presenter: CategotyDetailViewPresenterProtocol!
    
    private lazy var subView: UIView = {
        $0.snp.makeConstraints { $0.height.equalTo(CategoryDetailViewConstants.subViewHeight) }
        $0.snp.makeConstraints { $0.width.equalTo(CategoryDetailViewConstants.subViewWidth) }
        $0.layer.cornerRadius = CategoryDetailViewConstants.cornerRadius
        $0.layer.borderColor = Resources.Colors.App.borderColor.cgColor
        $0.layer.borderWidth = CategoryDetailViewConstants.borderWidth
        $0.backgroundColor = Resources.Colors.App.accent
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    lazy var imageView: UIImageView = {
        $0.snp.makeConstraints { $0.height.equalTo( CategoryDetailViewConstants.imageViewHeight) }
        $0.snp.makeConstraints { $0.width.equalTo( CategoryDetailViewConstants.imageViewWidth) }
        $0.layer.cornerRadius = CategoryDetailViewConstants.cornerRadius
        $0.layer.masksToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var centerLabel: UILabel = {
        $0.backgroundColor = CategoryDetailViewConstants.labelBacgroundColor
        $0.text = Resources.Strings.MainScreen.posesTitle
        $0.font = CategoryDetailViewConstants.labelFont
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = CollectionCellConstants.sectionInset
        layout.itemSize = CollectionCellConstants.itemSize
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
        makeBackground(image: Resources.Backgrounds.main)
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
        cell.setImage(from: imageURL)
        return cell
    }
}


//MARK: - Configure
private extension CategoryDetailView {
    func configureLayout () {
        title = Resources.Strings.MainScreen.poseScreenTittle
        presenter.loadImageURLs()
        view.addSubviews(subView, centerLabel, collectionView)
        subView.addSubviews(imageView)
        
        makeSubViewConstraints()
        makeImageViewConstraints()
        makeCenterLabelConstraints()
        makeCollectionViewConstraints()
    }
    
    
    func makeSubViewConstraints() {
        subView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(CategoryDetailViewConstants.subViewTop)
            $0.centerX.equalTo(view)
        }
    }
    
    func makeImageViewConstraints() {
        imageView.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    func makeCenterLabelConstraints() {
        centerLabel.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(CategoryDetailViewConstants.centerLabelTop)
            $0.leading.trailing.equalTo(view).inset(CategoryDetailViewConstants.side)
        }
    }
    
    func makeCollectionViewConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(centerLabel.snp.bottom).offset(CategoryDetailViewConstants.side)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view).inset(CategoryDetailViewConstants.bottom)
        }
    }
    
}

//MARK: - CategoryDetailViewConstants
fileprivate enum CategoryDetailViewConstants {
    static let cellIdentifier: String = "CategoryDetailCell"
    static let cornerRadius: CGFloat = 25
    static let borderWidth: CGFloat = 2
    static let labelBacgroundColor: UIColor = .white.withAlphaComponent(0.5)
    static let labelFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
    static let subViewHeight: CGFloat = 255
    static let subViewWidth: CGFloat = 354
    static let subViewTop: CGFloat = 22
    static let imageViewHeight: CGFloat = 200
    static let imageViewWidth: CGFloat = 200
    static let centerLabelTop: CGFloat = 16
    static let side: CGFloat = 8
    static let trailing: CGFloat = -8
    static let bottom: CGFloat = 100
}

