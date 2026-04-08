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
    private var state: ChallengeState
    
    init(challengeName: String){
        self.state = ChallengeState(totalDays: 7, currentDay: 1, challengeName: challengeName)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = challengeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        challengeView.buttonCompletedChallenge.addTarget(self, action: #selector(didTapCompleteDay), for: .touchUpInside)
        
        render()
    }
    @objc private func didTapCompleteDay() {
        if state.isFinished {
            state = ChallengeState(totalDays: state.totalDays, currentDay: 1, challengeName: state.challengeName)
        } else {
            state.currentDay += 1
        }
        render()
    }
    private func render() {
        challengeView.update(with: state)
    }
}
