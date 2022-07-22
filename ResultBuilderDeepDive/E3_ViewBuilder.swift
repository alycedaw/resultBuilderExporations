//
//  E3_ViewBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import SwiftUI

extension ViewBuilder {
    static func buildPartialBlock(first: some View) -> some View  {
        buildBlock(first)
    }

    static func buildPartialBlock(accumulated: some View, next: some View) -> some View {
        buildBlock(TupleView((accumulated, next)))
    }
}

func e3_viewBuilder() {
    struct MyView: View {
        var body: some View {
            VStack {
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
                Text("11")
                Text("12")
                Text("13")
                Text("14")
                Text("15")
            }
        }
    }
    print(type(of: MyView().body))
}
