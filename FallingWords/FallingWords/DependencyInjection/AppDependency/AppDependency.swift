//
//  AppDependency.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import Foundation

class AppDependency: CoreDependency {

    // MARK: - WordsBankService
    override func wordsBankService() -> WordsBankService {
        return FWWordBankService()
    }

    // MARK: - GameEngineService
    override func gameEngineService() -> GameEngineService {
        let wordsBankService: WordsBankService = FWWordBankService()
        return FWGameEngineService(wordsBankService: wordsBankService)
    }
}
