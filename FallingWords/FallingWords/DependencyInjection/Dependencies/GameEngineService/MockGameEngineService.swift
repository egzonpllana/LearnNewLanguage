//
//  MockGameEngineService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

class MockGameEngineService: GameEngineService {
    var gameResult: AnswerResultModel = answerResultModel

    func getRandomWord(completion: @escaping (Result<RandomWordViewModel, GameEngineError>) -> Void) {
        completion(.success(randomWordViewModel))
    }

    func handleUserAnswer(onWordModel wordModel: RandomWordViewModel, withAnswer answer: Bool, completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {
        completion(.success(answerResultViewModel))
    }

    func restartGame(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {
        completion(.success(answerResultViewModel))
    }

    func handleNoAnswer(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {
        completion(.success(answerResultViewModel))
    }
}
