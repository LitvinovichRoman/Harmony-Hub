//
//  MainView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

//MARK: -- MainView Protocol
protocol MainViewProtocol: AnyObject {
    var tipOfTheDayLabel: UILabel { get set }
    var collectionView: UICollectionView { get set }
}

//MARK: - Final Class MainView
final class MainView: UIViewController, Backgroundable, MainViewProtocol {
    //MARK: -- Mock
    private let name = "Джош"
    
    //MARK: - Presenter
    var presenter: MainViewPresenterProtocol!
    
    //MARK: - Properties[lazy labels]
    private lazy  var topLabel: UILabel = {
        $0.text = Resources.Strings.MainScreen.tipOfTheDayText
        $0.textColor = Resources.Colors.App.textColor
        $0.font = MainViewConstants.labelsFont
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    lazy var tipOfTheDayLabel: UILabel = {
        $0.textColor = Resources.Colors.App.textColor
        $0.numberOfLines = MainViewConstants.numberOfLines
        $0.backgroundColor = MainViewConstants.tipOfTheDayBackgroundColor
        $0.layer.borderColor = Resources.Colors.App.borderColor.cgColor
        $0.layer.borderWidth = MainViewConstants.borderWidth
        $0.layer.cornerRadius = MainViewConstants.cornerRadius
        $0.layer.masksToBounds = true
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy  var bottomLabel: UILabel = {
        $0.text = Resources.Strings.MainScreen.category
        $0.textColor = Resources.Colors.App.textColor
        $0.font = MainViewConstants.labelsFont
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    //MARK: -- Properties[collectionView]
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CollectionCellConstants.itemSize
        layout.sectionInset = CollectionCellConstants.sectionInset
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: MainViewConstants.cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.main)
     
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadImageURLs()
        presenter.showDailyTip()
    }
}

//MARK: -- DataSource & DelegateFlowLayout
extension MainView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewConstants.cellIdentifier,
                                                            for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        let imageURL = presenter.imageURL(at: indexPath.item)
        cell.setImage(from: imageURL!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryIndex = indexPath.item
        guard let categoryDetailView = Builder.getCategoryDetailView(categoryIndex: categoryIndex) as? CategoryDetailView else { return }
        if let imageUrl = presenter.imageURL(at: indexPath.item) { categoryDetailView.imageUrl = imageUrl }
        navigationController?.pushViewController(categoryDetailView, animated: true)
    }
}

//MARK: - Configure
private extension MainView {
    func configureLayout() {
        title = Resources.Strings.MainScreen.greetings + " \(name)!"
        view.addSubviews(topLabel, tipOfTheDayLabel, bottomLabel, collectionView)
        
        makeTopLabelConstraint()
        makeTipOfTheDayLabelConstraint()
        makeBottomLabelConstraint()
        makeCollectionViewConstraint()
    }
    
    func makeTopLabelConstraint() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: MainViewConstants.topLabelTop),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  MainViewConstants.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: MainViewConstants.trailingAnchor)
        ])
    }
    
    func makeTipOfTheDayLabelConstraint() {
        NSLayoutConstraint.activate([
            tipOfTheDayLabel.heightAnchor.constraint(equalToConstant: MainViewConstants.tipOfTheDayLabelHeight),
            tipOfTheDayLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: MainViewConstants.tipOfTheDayLabelTop),
            tipOfTheDayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            tipOfTheDayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  MainViewConstants.trailingAnchor)
        ])
    }
    
    func makeBottomLabelConstraint() {
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: tipOfTheDayLabel.bottomAnchor, constant: MainViewConstants.bottomLabelTop),
            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  MainViewConstants.trailingAnchor),
        ])
    }
    
    func makeCollectionViewConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: MainViewConstants.collectionViewTop),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  MainViewConstants.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainViewConstants.collectionViewBottom)
        ])
    }
    
}

//MARK: - MainViewConstants
fileprivate enum MainViewConstants {
    static let labelsFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
    static let tipOfTheDayBackgroundColor: UIColor = Resources.Colors.App.accent.withAlphaComponent(0.4)
    static let numberOfLines: Int = 0
    static let cornerRadius: CGFloat = 25
    static let borderWidth: CGFloat = 2
    static let cellIdentifier: String = "MainCell"
    static let tipOfTheDayLabelTop: CGFloat = 24
    static let tipOfTheDayLabelHeight: CGFloat = 200
    static let bottomLabelTop: CGFloat = 24
    static let topLabelTop: CGFloat = 12
    static let collectionViewTop: CGFloat = 4
    static let leadingAnchor: CGFloat = 8
    static let trailingAnchor: CGFloat = -8
    static let collectionViewBottom: CGFloat = -70
}
