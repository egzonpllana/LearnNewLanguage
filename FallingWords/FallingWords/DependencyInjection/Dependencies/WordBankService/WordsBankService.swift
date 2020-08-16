//
//  WordsBankService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

protocol WordsBankService {
    var usedWords: [String] { get }

    /**
     **Get all the words in dictionary format from project resources.**
     * Details:
        - JSON file from resources will be decoded to WordModel.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: WordModel
     *     - on failure: WordBankError
     */

    func getWordsFromResources(completion: @escaping (Result<[WordModel], WordBankError>) -> Void)

    /**
     **Get a random word from WordsBank**
     * Details:
        - WordsBank will provide a random word, with random translation value of correct or not.
     - Parameters:
     *     - no parameters
     - Completion:
     *     - on success: RandomWordModel
     *     - on failure: WordBankError
     */
    func getRandomWordFromBank(completion: @escaping (Result<RandomWordModel, WordBankError>) -> Void)
}
