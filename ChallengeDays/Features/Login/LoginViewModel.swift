//
//  LoginViewModel.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import Foundation

final class LoginViewModel {

    var nickName: String = ""
    var challenge: String = ""
    
    var isFormValid: Bool {
        !nickName.trimmingCharacters(in: .whitespaces).isEmpty && !challenge.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func submit() -> Bool {
        return isFormValid
    }
}
