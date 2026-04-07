//
//  LoginView.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    let iconView = IconAppView()
    
    let challengeField = TextFieldComponent(placeholder: "What's your challenge?", keyboardType: .default)
    
    let challengeNickNameField = TextFieldComponent(placeholder: "What's your nickname?", keyboardType: .default)
    
    let button = ButtonComponent(title: "Start Challenge")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Challenge Days"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Colors.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set a goal. Show up every day. No excuses."
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = Colors.textSecondary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.backgroundDark
        
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        addSubview(challengeNickNameField)
        addSubview(challengeField)
        addSubview(button)
        
        
        iconView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor, constant: 70),
            
            subTitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 40),
            
            challengeNickNameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            challengeNickNameField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 40),
            challengeNickNameField.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            challengeNickNameField.heightAnchor.constraint(equalToConstant: 56),
            
            challengeField.centerXAnchor.constraint(equalTo: centerXAnchor),
            challengeField.centerYAnchor.constraint(equalTo: challengeNickNameField.bottomAnchor, constant: 56),
            challengeField.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            challengeField.heightAnchor.constraint(equalToConstant: 70),
            
            button.centerXAnchor.constraint(equalTo: challengeField.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
            button.widthAnchor.constraint(equalTo: widthAnchor, constant: -48),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
