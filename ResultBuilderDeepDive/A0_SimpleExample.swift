//
//  A0_SimpleExample.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/17/22.
//

import Foundation

func a0_simpleExample() {
    func sayTimes(_ value: String, _ times: Int) -> String {
        var result = value
        for _ in 1..<times {
            result.append(value)
        }
        return result
    }
    let result = sayTimes("hello ", 3)
    print("Result: \(result)")

    /// Implement fancy multiply

    @resultBuilder
    enum SayTimesBuilder {
        @available(*, unavailable, message: "You need to include an int")
        static func buildBlock(_ components: String) -> String {
            fatalError()
        }
        static func buildBlock(_ value: String, _ times: Int) -> String {
            var result = value
            for _ in 1..<times {
                result.append(value)
            }
            return result
        }
    }

    func fancySayTimes(@SayTimesBuilder function: () -> String) -> String {
        function()
    }
    let fancyResult = fancySayTimes {
        "goodbye "
        3
    }
    print("Fancy result: \(fancyResult)")

    let messUp = fancySayTimes {
        "What? "
        5
        return "Nothing"
    }
    print("Mess up: \(messUp)")

    let partialBuild = fancySayTimes {
        do {
            "Blah "
            2
        }
        3
    }
    print("Partial build: \(partialBuild)")

}
