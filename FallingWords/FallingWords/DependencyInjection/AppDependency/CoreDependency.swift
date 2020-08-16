//
//  CoreDependency.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

// NOTE: Our Dependency Injection pattern is based on
// http://basememara.com/swift-protocol-oriented-dependency-injection/

import UIKit

protocol Dependency {
    func wordsBankService() -> WordsBankService
    func gameEngineService() -> GameEngineService
}

class CoreDependency: Dependency {
    func wordsBankService() -> WordsBankService {
        return MockWordsBankService()
    }

    func gameEngineService() -> GameEngineService {
        return MockGameEngineService()
    }
}
