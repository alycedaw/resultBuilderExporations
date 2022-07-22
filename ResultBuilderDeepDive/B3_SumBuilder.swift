//
//  B3_SumBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/17/22.
//

import Foundation

func b3_sumBuilder() {

    @resultBuilder
    enum IntSumBuilder {
        static func buildBlock(_ components: Int...) -> Int {
            components.reduce(0, +)
        }

        static func buildArray(_ components: [Int]) -> Int {
            components.reduce(0, +)
        }
    }

    func sum(@IntSumBuilder _ builder: () -> Int) -> Int {
        builder()
    }

    let n = sum {
        for i in 1...100 {
            i
        }

    }
    print(n)

    let m = sum {
        for i in 1...3 {
            i
            i * 3
        }
        for i in 10...11 {
            i - 6
            12
        }
    }
    print(m)
}
