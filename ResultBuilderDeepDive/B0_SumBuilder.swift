//
//  A2_SumBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/17/22.
//

import Foundation

func b0_sumBuilder() {

    @resultBuilder
    enum IntSumBuilder {
        static func buildBlock(_ components: Int...) -> Int {
            components.reduce(0, +)
        }
    }

    func sum(@IntSumBuilder _ builder: () -> Int) -> Int {
        builder()
    }

    let n = sum { 1; 2; 3; 4; 5 }
    print(n)
}
