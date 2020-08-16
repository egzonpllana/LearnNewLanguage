//
//  FWWordBankService.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

class FWWordBankService: WordsBankService {
    var usedWords: [String] = []

    func getWordsFromResources(completion: @escaping (Result<[WordModel], WordBankError>) -> Void) { // use Result
        guard let path = Bundle.main.path(forResource: "words", ofType: "json") else {
            assertionFailure()
            completion(.failure(.resourceNotFound))
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonData = try JSONDecoder().decode([WordModel].self, from: data)
            completion(.success(jsonData))
            return
        }

        catch {
            assertionFailure()
            completion(.failure(.errorDecodingData))
        }
    }

    func getRandomWordFromBank(completion: @escaping (Result<RandomWordModel, WordBankError>) -> Void) { // use Result

        // Words bank from Resources
        getWordsFromResources { (result) in
            switch result {
            case .success(let wordsBank):
                // Generate boolean value to return or not correct word
                let shouldReturnCorrectWord: Bool = Bool.random()

                // Generate randomly correct or not translation with a word model
                if shouldReturnCorrectWord {

                    // Word bank must contain a random element
                    guard let randomWordOne = wordsBank.randomElement() else {
                        fatalError()
                    }

                    // Construct Rand Word Model
                    let wordModel: RandomWordModel = .init(wordModel: randomWordOne, isCorrect: true)

                    self.usedWords.append(wordModel.wordModel.englishWord)
                    completion(.success(wordModel))
                } else {

                    // Word bank must contain a random elements
                    guard let randomWordOne = wordsBank.randomElement(),
                        let randomWordTwo = wordsBank.randomElement() else {
                            fatalError()
                    }

                    // Get mixed transation Word Model
                    let englishWord = randomWordOne.englishWord
                    let spanishWord = randomWordTwo.spanishWord
                    let wordModel: WordModel = .init(englishWord: englishWord, spanishWord: spanishWord)
                    let randomWord: RandomWordModel = .init(wordModel: wordModel, isCorrect: false)

                    self.usedWords.append(wordModel.englishWord)
                    completion(.success(randomWord))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
