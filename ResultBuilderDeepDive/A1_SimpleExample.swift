//
//  A1_SimpleExample.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

func a1_simpleExample() {
    @resultBuilder
    enum SayTimesBuilder {
        static func buildBlock(_ value: String, _ times: Int) -> String {
            var result = value
            for _ in 1..<times {
                result.append(value)
            }
            return result
        }
        static func buildBlock(_ components: String...) -> String {
            components.joined()
        }
    }

    func sayTimes(@SayTimesBuilder function: () -> String) -> String {
        function()
    }

    let sayManyThingsManyTimes = sayTimes {
        do {
            "one "
        }
        do {
            "two "
            2
        }
        do {
            "three "
            3
        }
    }
    print(sayManyThingsManyTimes)

    let emptyResult = sayTimes {

    }
    print(emptyResult)
}
