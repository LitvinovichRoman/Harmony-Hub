//
//  ThoughtCell.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 5.08.24.
//

import UIKit
import SpriteKit

// MARK: - Final Class ThoughtCell
final class ThoughtCell: UITableViewCell {
    //MARK: -- Properties
    var titleLabel: UILabel = {
        $0.font = ThoughtCellConstants.titleLabelFont
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    var messageTextLabel: UILabel = {
        $0.numberOfLines = ThoughtCellConstants.messageTextLabelFumberOfLines
        $0.font = ThoughtCellConstants.messageTextLabelFont
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    var dateLabel: UILabel = {
        $0.font = ThoughtCellConstants.dateLabelFont
        $0.textAlignment = .right
        $0.textColor = .lightGray
        return $0
    }(UILabel())
   
    //MARK: -- Init methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure Cell
private extension ThoughtCell {
    func configureCell() {
        layer.cornerRadius = ThoughtCellConstants.cornerRadius
        backgroundColor = ThoughtCellConstants.backgroundColor
        contentView.addSubviews(titleLabel, messageTextLabel, dateLabel)
        setConstraints(titleLabel, messageTextLabel, dateLabel)
    }
    
    func setConstraints(_ elements: UIView...) {
        elements.enumerated().forEach { index, view in
            view.snp.makeConstraints {
                switch index {
                case 0:  $0.top.equalTo(contentView).offset(ThoughtCellConstants.top)
                default: $0.top.equalTo(elements[index - 1].snp.bottom).offset(ThoughtCellConstants.top)
                }
            }
        }

        elements.last?.snp.makeConstraints {
            $0.bottom.equalTo(contentView).offset(ThoughtCellConstants.dateLabelBottom)
        }
        
        elements.forEach {
            $0.snp.makeConstraints {
                $0.leading.trailing.equalTo(contentView).inset(ThoughtCellConstants.side)
            }
        }
    }
}

//MARK: - ThoughtCellConstants
fileprivate enum ThoughtCellConstants {
    static let cornerRadius: CGFloat = 25
    static let backgroundColor: UIColor = .white.withAlphaComponent(0.4)
    static let titleLabelFont: UIFont = .boldSystemFont(ofSize: 16)
    static let messageTextLabelFont: UIFont = .systemFont(ofSize: 14)
    static let dateLabelFont: UIFont = .systemFont(ofSize: 10)
    static let messageTextLabelFumberOfLines: Int = 0
    static let top: CGFloat = 4
    static let side: CGFloat = 16
    static let dateLabelBottom: CGFloat = -4
}
