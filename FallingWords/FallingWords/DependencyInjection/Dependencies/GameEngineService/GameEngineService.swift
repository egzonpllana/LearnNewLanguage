//
//  GameEngineService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

protocol GameEngineService {

    /**
     **Get current game session stats.**
     * Details:
        - Returns game lifes and points count.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: RandomWordViewModel
     *     - on failure: GameEngineError
     */

    var gameResult: AnswerResultModel { get }

    /**
     ** Return a random word from WordsBank.**
     * Details:
        - Returns a word model.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: RandomWordViewModel
     *     - on failure: GameEngineError
     */

    func getRandomWord(completion: @escaping (Result<RandomWordViewModel, GameEngineError>) -> Void)


    /**
     ** Handle the given answer from the user.**
     * Details:
        - Check for current user lifes and points.
     - Parameters:
     *     - wordModel:     RandomWordViewModel
     *     - withAnswer:    Bool
     - Completion:
     *     - on success: AnswerResultViewModel
     *     - on failure: GameEngineError
     */

    func handleUserAnswer(onWordModel wordModel: RandomWordViewModel, withAnswer answer: Bool, completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void)

    /**
     ** Restarts the game data.**
     * Details:
        - Restart user lifes to 3 and poits reset to 0.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: AnswerResultViewModel
     *     - on failure: GameEngineError
     */

    func restartGame(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void)

    /**
     ** Handle when user does not provide any answer.**
     * Details:
        - Will reduce lifes count with 1, if reaches lower than 0, will report as game over.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: AnswerResultViewModel
     *     - on failure: GameEngineError
     */

    func handleNoAnswer(completion: @escaping (Result<AnswerResultViewModel, GameEngineError>) -> Void)
}
