//
//  UIStackView.ext.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

extension UIStackView {
    func remove(_ element: UIView) {
        self.removeArrangedSubview(element)
    }
}
