//
//  CustomInput.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

class TextFieldComponent: UIView {
    
    private let textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.font = .systemFont(ofSize: 16)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = Colors.inputBackground
        field.layer.borderColor = Colors.borderSoft.cgColor
        field.layer.cornerRadius = 16
        field.layer.borderWidth = 1.0
        field.tintColor = Colors.textPrimary
        field.textColor = Colors.textPrimary
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.rightView = paddingView
        field.rightViewMode = .always
        
        return field
    }()
    
    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    init(
        placeholder: String,
        keyboardType: UIKeyboardType = .default
    ){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: Colors.textSecondary]
        )
        
        textField.keyboardType = keyboardType
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
