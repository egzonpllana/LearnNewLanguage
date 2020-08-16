//
//  FWGameEngineService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

class FWGameEngineService: GameEngineService {

    private let wordsBankService: WordsBankService

    var gameResult: AnswerResultModel = AnswerResultModel(lifes: 3, points: 0)

    init(wordsBankService: WordsBankService) {
        self.wordsBankService = wordsBankService
    }

    func getRandomWord(completion: @escaping (Result<RandomWordViewModel, GameEngineError>) -> Void) {
        wordsBankService.getRandomWordFromBank { (result) in
            switch result {
            case .success(let randomWord):
                let wordViewModel: RandomWordViewModel = .init(wordObject: randomWord)
                completion(.success(wordViewModel))
            case .failure:
                completion(.failure(.getRandomWordNotPossible))
            }
        }
    }

    func handleUserAnswer(onWordModel wordModel: RandomWordViewModel, withAnswer answer: Bool, completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {

        if (answer == wordModel.isCorrect) {
            gameResult.points += 1
            let resultViewModel: AnswerResultViewModel = .init(answerModel: gameResult)
            completion(.success(resultViewModel))
        } else {
            gameResult.lifes -= 1

            if gameResult.lifes == -1 {
                completion(.failure(.gameOver))
            } else {
                let resultViewModel: AnswerResultViewModel = .init(answerModel: gameResult)
                completion(.success(resultViewModel))
            }
        }
    }

    func handleNoAnswer(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {
        gameResult.lifes -= 1

        if gameResult.lifes < 0 {
            completion(.failure(.gameOver))
        } else {
            let resultViewModel: AnswerResultViewModel = .init(answerModel: gameResult)
            completion(.success(resultViewModel))
        }
    }

    func restartGame(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void) {
        gameResult = AnswerResultModel(lifes: 3, points: 0)
        let resultViewModel: AnswerResultViewModel = .init(answerModel: gameResult)
        completion(.success(resultViewModel))
    }
}
