//
//  LoginViewController.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private let contentView = LoginView()
    private var viewModel = LoginViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        contentView.button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
    }
    
    @objc private func handleSubmit() {
        print("nick:", contentView.challengeNickNameField.text ?? "nil")
        print("challenge:", contentView.challengeField.text ?? "nil")
        
        viewModel.nickName = contentView.challengeNickNameField.text ?? ""
        viewModel.challenge = contentView.challengeField.text ?? ""
        
        if viewModel.isFormValid {
            clearFields()
            print("✅ válido")
            navigationController?.pushViewController(ChallengeViewController(), animated: true)
        } else {
            showAlert()
        }
    }
    
    private func clearFields() {
        contentView.challengeNickNameField.text = ""
        contentView.challengeField.text = ""
    }
    
    private func showAlert() {
         let alert = UIAlertController(
             title: "Erro",
             message: "Preencha todos os campos",
             preferredStyle: .alert
         )
         
         alert.addAction(UIAlertAction(title: "OK", style: .default))
         present(alert, animated: true)
     }
}
