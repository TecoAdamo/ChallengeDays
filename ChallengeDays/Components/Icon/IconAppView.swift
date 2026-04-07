//
//  IconAppView.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

final class IconAppView: UIView {

    private let gradientLayer = CAGradientLayer()

    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGradient()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private func setupView() {
        layer.cornerRadius = 24
        clipsToBounds = true

        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(systemName: "flame")

        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 0.36, green: 0.64, blue: 0.98, alpha: 1).cgColor,
            UIColor(red: 0.66, green: 0.36, blue: 0.95, alpha: 1).cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }

    func configure(image: UIImage?) {
        iconImageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
}
