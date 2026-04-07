//
//  ChallengeView.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

class ChallengeView: UIView {
    
    let card = CustomCard()
    let progressView = ProgressCircleView()
    
    let stepperView = StepperView(steps: 7, currentStep: 2)
    
    let subCard = CustomCard()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "7 Days"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var subLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "CHALLENGE"
        label.textColor = Colors.textSecondary
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.backgroundDark
        
        addSubview(label)
        addSubview(subLabel)
        addSubview(card)
        addSubview(progressView)
        
        addSubview(stepperView)
        
        addSubview(subCard)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        subCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 68),
            
            subLabel.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            subLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 6),
            
            card.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 32),
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            card.heightAnchor.constraint(equalToConstant: 80),
            
            progressView.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 32),
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 200),
            progressView.heightAnchor.constraint(equalToConstant: 200),
            
            stepperView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            stepperView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stepperView.heightAnchor.constraint(equalToConstant: 40),
            
            subCard.topAnchor.constraint(equalTo: stepperView.bottomAnchor, constant: 32),
            subCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            subCard.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        progressView.setProgress(value: 2, total: 7)
    }
    private func setupCard() {
        card.configure(
            title: "Estudar",
            icon: "flame.fill"
        )
        subCard.configure(title: "Day 2 - The Beginning")
    }
}
