//
//  DependencyInjector.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import UIKit

/// The singleton dependency container reference
/// which can be reassigned to another container
struct DependencyInjector {
    static var dependencies: Dependency = CoreDependency()
    private init() { }
}

/// Attach to any type for exposing the dependency container
protocol HasDependencies {
    var dependencies: Dependency { get }
}

extension HasDependencies {
    /// container for dependency instance factories
    var dependencies: Dependency {
        return DependencyInjector.dependencies
    }
}

extension UIApplicationDelegate {
    func configure(dependency: Dependency) {
        DependencyInjector.dependencies = dependency
    }
}
