//
//  ProgressBarCircle.swift
//  ChallengeDays
//
//  Created by Mateus on 05/04/26.
//

import Foundation
import UIKit

class ProgressCircleView: UIView {
    
    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = Colors.gradientStart
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "of 7 days"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupPath()
    }
    
    private func setupLayers() {
        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
        
        trackLayer.strokeColor = UIColor.darkGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 12
        
        progressLayer.strokeColor = Colors.gradientStart.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 12
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
    }
    
    private func setupPath() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius: CGFloat = min(bounds.width, bounds.height) / 2 - 20
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        
        trackLayer.path = path.cgPath
        progressLayer.path = path.cgPath
    }
    
    private func setupLabels() {
        addSubview(progressLabel)
        addSubview(subtitleLabel)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 4)
        ])
    }
    
    func setProgress(value: Int, total: Int) {
        let progress = CGFloat(value) / CGFloat(total)
        
        progressLayer.strokeEnd = progress
        progressLabel.text = "\(value)"
        subtitleLabel.text = "of \(total) days"
    }
}
