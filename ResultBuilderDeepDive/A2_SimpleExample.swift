//
//  A2_SimpleExample.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

func a2_simpleExample() {
    @resultBuilder
    enum SayTimesBuilder {
        static func buildBlock(_ times: Int) -> Int {
            times
        }
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

    let result1 = sayTimes {
        "hello! "
        do {
            3
        }
    }
    print(result1)

    func weirdStuff(@SayTimesBuilder function: () -> Int) -> Int {
        function()
    }

    let result2 = weirdStuff {
        1
    }
    print(result2)

}
