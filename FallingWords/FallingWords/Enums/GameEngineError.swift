//
//  GameEngineError.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

enum GameEngineError: String, CaseIterable {
    case getRandomWordNotPossible = "There was an error getting random word from Word Bank Service."
    case wrongAnswer = "Oops, the answer is incorrect."
    case gameOver = "You have spent all your lives. Restart the game from beginning to get 3 lives."
}

extension GameEngineError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}
