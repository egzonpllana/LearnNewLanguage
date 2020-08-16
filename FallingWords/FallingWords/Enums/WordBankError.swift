//
//  WordBankError.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

enum WordBankError: String, CaseIterable {
    case resourceNotFound = "Resource can not be found on the given path."
    case errorDecodingData = "There was an error decoding data from JSON file."
}

extension WordBankError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}
