//
//  MockWordsBankService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

class MockWordsBankService: WordsBankService {
    var usedWords: [String] = []

    func getWordsFromResources(completion: @escaping (Result<[WordModel], WordBankError>) -> Void) {
        completion(.success([stubWordModel]))
    }

    func getRandomWordFromBank(completion: @escaping (Result<RandomWordModel, WordBankError>) -> Void) {
        completion(.success(stubRandomWordModel))
    }
}
