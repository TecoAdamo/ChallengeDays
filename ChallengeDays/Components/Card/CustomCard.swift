//
//  Cards.swift
//  ChallengeDays
//
//  Created by Mateus on 05/04/26.
//

import Foundation
import UIKit

class CustomCard: UIView {
    
    private let myCard: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = Colors.cardBackground
        stack.layer.cornerRadius = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.1
        stack.layer.shadowOffset = CGSize(width: 0, height: 4)
        stack.layer.shadowRadius = 8
        return stack
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "flame.fill")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(myCard)
        myCard.addSubview(iconContainer)
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 0.5, green: 0.3, blue: 0.9, alpha: 1).cgColor,
            UIColor(red: 0.3, green: 0.1, blue: 0.7, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        iconContainer.layer.insertSublayer(gradient, at: 0)
        iconContainer.addSubview(iconImage)
        
        textStack.addArrangedSubview(titleLabel)
        myCard.addArrangedSubview(textStack)
        addSubview(myCard)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
  
            myCard.topAnchor.constraint(equalTo: topAnchor),
            myCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            myCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            myCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconContainer.leadingAnchor.constraint(equalTo: myCard.leadingAnchor, constant: 16),
            iconContainer.centerYAnchor.constraint(equalTo: myCard.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40),
            
            iconImage.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            
            textStack.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
            textStack.centerYAnchor.constraint(equalTo: myCard.centerYAnchor),
            textStack.trailingAnchor.constraint(equalTo: myCard.trailingAnchor, constant: -16)
        ])
    }
    
    
    func configure(title: String, icon: String? = nil) {
        titleLabel.text = title
        
        if let icon = icon {
            iconImage.image = UIImage(systemName: icon)
            iconContainer.isHidden = false
        } else {
            iconContainer.isHidden = true
        }
        
        if let icon = icon {
            iconImage.image = UIImage(systemName: icon)
            if !myCard.arrangedSubviews.contains(iconContainer) {
                myCard.insertArrangedSubview(iconContainer, at: 0)
            }
            iconContainer.isHidden = false
        } else {
            iconContainer.isHidden = true
            myCard.removeArrangedSubview(iconContainer)
            iconContainer.removeFromSuperview()
        }
    }
}

