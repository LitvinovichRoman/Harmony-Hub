//
//  UIView.ext.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        views.forEach(addSubview(_:))
    }
}
