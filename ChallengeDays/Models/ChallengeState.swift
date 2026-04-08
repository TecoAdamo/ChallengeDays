//
//  ChallengeState.swift
//  ChallengeDays
//
//  Created by Mateus on 07/04/26.
//

import Foundation
struct ChallengeState {
    let totalDays: Int
    var currentDay: Int
    var challengeName: String

    var completedDays: Int { currentDay - 1 }
    var activeDay: Int { currentDay }
    var isFinished: Bool { currentDay > totalDays }
}
