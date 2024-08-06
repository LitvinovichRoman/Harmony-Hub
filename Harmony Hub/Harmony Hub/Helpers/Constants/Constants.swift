//
//  Constants.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 25.07.24.
//

import UIKit

//MARK: -- CollectionCellConstants
enum CollectionCellConstants {
    static let cornerRadius: CGFloat = 25
    static let borderWidth: CGFloat = 2
    static let itemSize: CGSize = .init(width: 140, height: 140)
    static let sectionInset: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
}

//MARK: -- ThoughtCellConstants
enum ThoughtCellConstants {
    static let cornerRadius: CGFloat = 25
    static let backgroundColor: UIColor = .white.withAlphaComponent(0.4)
    static let titleLabelFont: UIFont = .boldSystemFont(ofSize: 16)
    static let messageTextLabelFont: UIFont = .systemFont(ofSize: 14)
    static let dateLabelFont: UIFont = .systemFont(ofSize: 10)
    static let messageTextLabelFumberOfLines: Int = 0
    static let topAnchor: CGFloat = 4
    static let leadingAnchor: CGFloat = 16
    static let trailingAnchor: CGFloat = -16
    static let dateLabelBottomAnchor: CGFloat = -4
}

//MARK: -- ThoughtsViewConstants
enum ThoughtsViewConstants {
    static let cellIdentifier: String = "ThoughtCell"
    static let dateFormat: String = "dd.MM.yyyy HH:mm"
    static let tableViewBottomAnchor: CGFloat = -100
}

//MARK: -- MainViewConstants
enum MainViewConstants {
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

//MARK: -- CategoryDetailViewConstants
enum CategoryDetailViewConstants {
    static let cellIdentifier: String = "CategoryDetailCell"
    static let cornerRadius: CGFloat = 25
    static let borderWidth: CGFloat = 2
    static let labelBacgroundColor: UIColor = .white.withAlphaComponent(0.5)
    static let labelFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
    static let subViewHeightAnchor: CGFloat = 255
    static let subViewWidthAnchor : CGFloat = 354
    static let subViewTopAnchor: CGFloat = 22
    static let imageViewHeightAnchor: CGFloat = 200
    static let imageViewWidthAnchor: CGFloat = 200
    static let centerLabelTopAnchor: CGFloat = 16
    static let leadingAnchor: CGFloat = 8
    static let trailingAnchor: CGFloat = -8
    static let bottomAnchor: CGFloat = -100
}

//MARK: -- TabBarViewConstants
enum TabBarViewConstants {
    static let cornerRadius: CGFloat = 35
    static let tabBarBacgroundColor: UIColor = .white.withAlphaComponent(0.5)
    static let tabViewStackBacgroundColor: UIColor = .white
    static let tabViewLeadingAnchor: CGFloat = 10
    static let tabViewTrailingAnchor: CGFloat = -10
    static let tabViewHeightAnchor: CGFloat = 70
    static let tabViewStackLeadingAnchor: CGFloat = 10
    static let tabViewStackTrailingAnchor: CGFloat = -10
    static let itemOffset: Int = 0
}

//MARK: -- TabViewConstants
enum TabViewConstants {
    static let cornerRadius: CGFloat = 35
    static let backgroundColor: UIColor = .white
    static let borderWidth: CGFloat = 2
    static let borderColor = UIColor.systemGray6.cgColor
}

//MARK: -- TabBarItemConstants
enum TabBarItemConstants {
    static let animateDuration: TimeInterval = 0.2
    static let cornerRadius: CGFloat = 20
    static let tabImageHeightAnchor: CGFloat = 25
    static let tabImageWidthAnchor: CGFloat = 25
    static let newImageRightConstraints: CGFloat = -10
    static let tabImageTopAnchor: CGFloat = 10
    static let tabImageBottomAnchor: CGFloat = -10
    static let tabImageLeadingAnchor: CGFloat = 10
    static let tabTextLeadingAnchor: CGFloat = 8
    static let tabTextTrailingAnchor: CGFloat = -10
}

//MARK: -- BaseAuthClassConstants
enum BaseAuthClassConstants {
    static let titleFont: UIFont = .systemFont(ofSize: 24, weight: .bold)
    static let titleLabelTopAnchor: CGFloat = 200
    static let titleLabelLeadingAnchor: CGFloat = 5
    static let titleLabelTrailingAnchor: CGFloat = -5
    static let textFieldsHeight: CGFloat = 50
    static let buttonsStackSpacing: CGFloat = 50
    static let buttonsHeight: CGFloat = 50
    static let textFieldStackSpacing: CGFloat = 20.0
    static let textFieldsStackViewTopAnchor: CGFloat = 50
    static let buttonsStackViewTopAnchor: CGFloat = 30
    static let textFieldsStackViewLeadingAnchor: CGFloat = 5
    static let textFieldsStackViewTrailingAnchor: CGFloat = -5
}
