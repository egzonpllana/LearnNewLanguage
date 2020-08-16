//
//  AnswerResultViewModel.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

struct AnswerResultViewModel {
    // The view model owns the model.
    // The model should have no clue who it is owned by.
    // The view model only know how to present data to the user.

    var lifes: Int
    var points: Int

    init(answerModel: AnswerResultModel) {
        self.lifes = answerModel.lifes < 0 ? 0 : answerModel.lifes
        self.points = answerModel.points
    }
}
