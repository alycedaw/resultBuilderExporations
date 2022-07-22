//
//  B1_SumBuilder_conditional.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/17/22.
//

import Foundation

func b1_sumBuilder() {

    @resultBuilder
    enum IntSumBuilder {
        static func buildBlock(_ components: Int...) -> Int {
            print("int sum builder build block called")
            return components.reduce(0, +)
        }

        static func buildOptional(_ component: Int?) -> Int {
            component ?? 0
        }

        static func buildEither(first component: Int) -> Int {
            component
        }

        static func buildEither(second component: Int) -> Int {
            component
        }
    }

    func sum(@IntSumBuilder _ builder: () -> Int) -> Int {
        builder()
    }
    let boolean = true
    let foolean = false

    let n = sum {
        1
        if boolean {
            2
        }
        if foolean {
            3
        }
        if foolean {
            4
            5
        } else {
            6
            7
        }
    }
    print(n)
}
