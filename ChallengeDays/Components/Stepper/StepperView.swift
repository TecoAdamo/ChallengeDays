//
//  StepperView.swift
//  ChallengeDays
//
//  Created by Mateus on 06/04/26.
//

import Foundation
import UIKit

class StepperView: UIView {

    private let steps: Int
    private var currentStep: Int
    private let accentColor = Colors.gradientStart

    init(steps: Int, currentStep: Int) {
        self.steps = steps
        self.currentStep = currentStep
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)
        pinToEdges(stack)

        (1...steps).forEach { step in
            let bubble = StepBubbleView(
                number: step,
                state: stepState(for: step),
                accentColor: accentColor
            )
            stack.addArrangedSubview(bubble)
        }
    }

    private func stepState(for step: Int) -> StepState {
        if step < currentStep { return .completed }
        if step == currentStep { return .active }
        return .inactive
    }
}
