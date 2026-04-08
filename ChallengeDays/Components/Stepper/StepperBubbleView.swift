//
//  StepperBubbleView.swift
//  ChallengeDays
//
//  Created by Mateus on 06/04/26.
//

import Foundation
import UIKit

class StepBubbleView: UIView {

    private let number: Int
    private let state: StepState
    private let accentColor: UIColor

    init(number: Int, state: StepState, accentColor: UIColor) {
        self.number = number
        self.state = state
        self.accentColor = accentColor
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        layer.cornerRadius = 20
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40)
        ])

        update(state: state)
    }

    func update(state: StepState) {
        subviews.forEach { $0.removeFromSuperview() }
        
        layer.borderWidth = 0
        
        switch state {
        case .completed:
            backgroundColor = accentColor
            addCenteredImage(systemName: "checkmark", color: .white)

        case .active:
            backgroundColor = .clear
            layer.borderColor = accentColor.cgColor
            layer.borderWidth = 2
            addCenteredLabel(text: "\(number)", color: accentColor)

        case .inactive:
            backgroundColor = Colors.cardBackground
            layer.borderColor = Colors.cardBackground.cgColor
            layer.borderWidth = 2
            addCenteredLabel(text: "\(number)", color: accentColor)
        }
    }}
