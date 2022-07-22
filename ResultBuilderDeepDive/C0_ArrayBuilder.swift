//
//  C0_ArrayBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

@resultBuilder
enum ArrayBuilder<T> {
    static func buildExpression(_ expression: T) -> [T] {
        [expression]
    }
//    static func buildExpression(_ expression: [T]) -> [T] {
//        expression
//    }
    static func buildBlock(_ components: [T]...) -> [T] {
        [T](components.joined())
    }
    static func buildOptional(_ component: [T]?) -> [T] {
        component ?? []
    }
    static func buildEither(first component: [T]) -> [T] {
        component
    }
    static func buildEither(second component: [T]) -> [T] {
        component
    }
    static func buildArray(_ components: [[T]]) -> [T] {
        components.flatMap { $0 }
    }
}

extension Array {
    init(@ArrayBuilder<Element> builder: () -> Self) {
        self = builder()
    }
}

func c0_arrayBuilder() {
    let result1 = [Int].init {
        1
        2
        3
        4
        5
    }
    print(result1)

    let result2 = [Double].init {
        1.2
        if result1[0] > 0 {
            2.3
            3.4
        }
        if result1[1] < 2 {
            4.5
            5.6
        }
        for n in 6...8 {
            Double(n) + Double(n) / 10 + 0.1
        }
    }
    print(result2)
    let result3 = Array<String>(builder: {
        "Let's combine result 1 and 2"
        // uncomment out buildExpression above to enable the below
//        result1.map { "\($0)" }
//        result2.map { "\($0)" }
//        ["good", "bye"]
    })
    print(result3)
}
