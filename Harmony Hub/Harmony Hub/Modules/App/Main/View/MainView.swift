//
//  MainView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

//MARK: -- MainViewProtocol
protocol MainViewProtocol: AnyObject {
    var tipOfTheDayLabel: UILabel { get set }
    var collectionView: UICollectionView { get set }
}

//MARK: -- MainView
class MainView: BaseAppView, MainViewProtocol {
    //MARK: -- Mock
    let name = "Джош"
    
    //MARK: - Presenter
    var presenter: MainViewPresenterProtocol!
    
    //MARK: - Properties[lazy labels]
    lazy  var topLabel: UILabel = {
        $0.text = Resources.Strings.MainScreen.greetings + " \(name)!"
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
    
    
    lazy  var bottomLabel: UILabel = {
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
        navigationController?.navigationBar.tintColor = .black
        configureBackground(with: Resources.Backgrounds.main)
        presenter.loadImageURLs()
        presenter.showDailyTip()
        configureLayout()
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
        cell.configure(with: imageURL!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryIndex = indexPath.item
        guard let categoryDetailView = Builder.getCategoryDetailView(categoryIndex: categoryIndex) as? CategoryDetailView else { return }
        if let imageUrl = presenter.imageURL(at: indexPath.item) { categoryDetailView.imageUrl = imageUrl }
        navigationController?.pushViewController(categoryDetailView, animated: true)
    }


}

//MARK: - Configure Layout
extension MainView {
    func configureLayout() {
        contentImage.addSubviews(topLabel, tipOfTheDayLabel, bottomLabel, collectionView)
        makeTopLabelConstraint()
        makeTipOfTheDayLabelConstraint()
        makeBottomLabelConstraint()
        makeCollectionViewConstraint()
    }
    
    //MARK: -- makeTopLabelConstraint
    func makeTopLabelConstraint() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: contentImage.safeAreaLayoutGuide.topAnchor, constant: MainViewConstants.topLabelTop),
            topLabel.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor, constant:  MainViewConstants.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant: MainViewConstants.trailingAnchor)
        ])
    }
    
    //MARK: -- makeTipOfTheDayLabelConstraint
    func makeTipOfTheDayLabelConstraint() {
        NSLayoutConstraint.activate([
            tipOfTheDayLabel.heightAnchor.constraint(equalToConstant: MainViewConstants.tipOfTheDayLabelHeight),
            tipOfTheDayLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: MainViewConstants.tipOfTheDayLabelTop),
            tipOfTheDayLabel.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            tipOfTheDayLabel.trailingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant:  MainViewConstants.trailingAnchor)
        ])
    }
    
    //MARK: -- makeBottomLabelConstraint
    func makeBottomLabelConstraint() {
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: tipOfTheDayLabel.bottomAnchor, constant: MainViewConstants.bottomLabelTop),
            bottomLabel.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant:  MainViewConstants.trailingAnchor),
        ])
    }
    
    //MARK: -- makeCollectionViewConstraint
    func makeCollectionViewConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: MainViewConstants.collectionViewTop),
            collectionView.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor, constant: MainViewConstants.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant:  MainViewConstants.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainViewConstants.collectionViewBottom)
        ])
    }
    
}


#Preview() {
    MainView()
}
