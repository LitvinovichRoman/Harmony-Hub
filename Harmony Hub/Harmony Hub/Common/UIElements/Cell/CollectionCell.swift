//
//  CollectionCell.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 23.07.24.
//

import UIKit
import Kingfisher

protocol CollectionCellProtocol {
    var imageView: UIImageView { get set }
    func configure(with url: URL)
}

class CollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        makeCellConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionCell: CollectionCellProtocol {
    private func makeCellConstarints() {
        contentView.addSubviews(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupCell() {
        layer.cornerRadius = CollectionCellConstants.cornerRadius
        layer.borderColor = Resources.Colors.App.borderColor.cgColor
        layer.borderWidth = CollectionCellConstants.borderWidth
        layer.masksToBounds = true
    }
    
    func configure(with url: URL) {
        imageView.kf.setImage(with: url)
    }
    
}
