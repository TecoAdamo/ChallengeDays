//
//  ExtensionsStepper.swift
//  ChallengeDays
//
//  Created by Mateus on 06/04/26.
//

import Foundation
import UIKit

extension UIView {

    func pinToEdges(_ view: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func centerInSuperview() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }

    func addCenteredLabel(text: String, color: UIColor) {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)
        label.centerInSuperview()
    }

    func addCenteredImage(systemName: String, color: UIColor) {
        let imageView = UIImageView(image: UIImage(systemName: systemName))
        imageView.tintColor = color
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        imageView.centerInSuperview()

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
