//
//  StubData.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

let stubWordModel: WordModel = WordModel(englishWord: "Hello", spanishWord: "Hola")
let stubRandomWordModel: RandomWordModel = RandomWordModel(wordModel: stubWordModel, isCorrect: true)


let answerResultModel: AnswerResultModel = AnswerResultModel(lifes: 3, points: 0)
let randomWordViewModel: RandomWordViewModel = RandomWordViewModel(wordObject: stubRandomWordModel)

let answerResultViewModel: AnswerResultViewModel = AnswerResultViewModel(answerModel: answerResultModel)
