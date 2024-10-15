//
//  CollectionCell.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 23.07.24.
//

import UIKit
import Kingfisher

// MARK: - CollectionCell Protocol
protocol CollectionCellProtocol {
    var imageView: UIImageView { get set }
    func setImage(from url: URL)
}

// MARK: - Final Class CollectionCell
final class CollectionCell: UICollectionViewCell, CollectionCellProtocol {
    // MARK: -- ImageView
    var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    // MARK: -- Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -- Set Image
    func setImage(from url: URL) {
        imageView.kf.setImage(with: url)
    }
}

// MARK: - Configure Layout
private extension CollectionCell {
    func configureLayout() {
        contentView.addSubviews(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configureCell() {
        layer.cornerRadius = CollectionCellConstants.cornerRadius
        layer.borderColor = Resources.Colors.App.borderColor.cgColor
        layer.borderWidth = CollectionCellConstants.borderWidth
        layer.masksToBounds = true
    }
}

//MARK: - CollectionCellConstants
enum CollectionCellConstants {
    static let cornerRadius: CGFloat = 25
    static let borderWidth: CGFloat = 2
    static let itemSize: CGSize = .init(width: 140, height: 140)
    static let sectionInset: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
}
