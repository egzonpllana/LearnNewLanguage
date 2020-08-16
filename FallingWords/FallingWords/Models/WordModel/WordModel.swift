//
//  WordModel.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

struct WordModel: Codable {
    let englishWord: String
    let spanishWord: String

    enum CodingKeys: String, CodingKey {
        case englishWord = "text_eng", spanishWord = "text_spa"
    }
}
