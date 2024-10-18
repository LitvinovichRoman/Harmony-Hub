//
//  ProgressView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

// MARK: - Final Class ProgressView
final class ProgressView: UIView {
    // MARK: -- Properties
    private var greyColor: CGColor?
    private var bowColor: CGColor?
    private var centerPoint: CGPoint?
    private var circularPath: UIBezierPath?
    
    private var lineWidth: CGFloat = 12
    private var radius: CGFloat = 150
    
    private let shapeLayer = CAShapeLayer()
    private let greyLayer = CAShapeLayer()
    
    private var score: Int = 0 { didSet { updateProgress() } }
    
    // MARK: -- Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
private extension ProgressView {
    func configureLayers() {
        layer.addSublayer(greyLayer)
        layer.addSublayer(shapeLayer)
        
        centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .pi, endAngle: .pi * 2, clockwise: true)
        
        greyLayer.path = circularPath?.cgPath
        greyLayer.strokeColor = greyColor
        greyLayer.lineWidth = lineWidth
        greyLayer.lineCap = .round
        greyLayer.fillColor = UIColor.clear.cgColor
        greyLayer.shadowColor = UIColor.black.cgColor
        greyLayer.shadowOpacity = 1
        greyLayer.shadowOffset = .zero
        greyLayer.shadowRadius = 2
        
        shapeLayer.path = circularPath?.cgPath
        shapeLayer.strokeColor = bowColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
    func updateProgress() {
        centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let endAngle: CGFloat = .pi + (.pi * (CGFloat(score) / 100.0))
        circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .pi, endAngle: endAngle, clockwise: true)
        
        shapeLayer.path = circularPath?.cgPath
        shapeLayer.strokeEnd = CGFloat(score) / 100.0
    }
}

// MARK: - Set Methods
extension ProgressView {
    func setProgress(to newScore: Int) { score = newScore }
    
    func setColors(grey: UIColor, bow: UIColor) {
        greyColor = grey.cgColor
        bowColor = bow.cgColor
        configureLayers()
    }
    
    func setLineWidth(_ width: CGFloat) {
        lineWidth = width
        configureLayers()
    }
    
    func setRadius(_ newRadius: CGFloat) {
        radius = newRadius
        configureLayers()
    }
}
