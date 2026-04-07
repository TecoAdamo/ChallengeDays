//
//  ChallengeViewController.swift
//  ChallengeDays
//
//  Created by Mateus on 28/03/26.
//

import Foundation
import UIKit

class ChallengeViewController: UIViewController {
    
    private let challengeView = ChallengeView()
    
    override func loadView() {
        view = challengeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
