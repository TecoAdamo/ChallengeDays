//
//  CustomButton.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

class ButtonComponent: UIButton {
    
    init(title: String) {
        
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(Colors.textPrimary, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        backgroundColor = Colors.gradientStart
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
