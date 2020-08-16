//
//  RandomWordViewModel.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

struct RandomWordViewModel {
    // The view model owns the model.
    // The model should have no clue who it is owned by.
    // The view model only know how to present data to the user.

    var englishWord: String
    var spanishWord: String
    var isCorrect: Bool

    init(wordObject: RandomWordModel) {
        self.englishWord = wordObject.wordModel.englishWord.capitalized
        self.spanishWord = wordObject.wordModel.spanishWord.capitalized
        self.isCorrect = wordObject.isCorrect
    }
}
