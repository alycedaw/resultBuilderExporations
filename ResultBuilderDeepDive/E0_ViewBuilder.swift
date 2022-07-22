//
//  E0_ViewBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import SwiftUI

func view(@ViewBuilder builder: () -> some View) -> some View {
    builder()
}

func e0_viewBuilder() {
    let groupedViews: some View = view {
        Group {
            Text("one")
            Text("two")
            Text("three")
            Text("four")
            Text("five")
        }
        Group {
            Text("six")
            Text("seven")
            Text("eight")
            Text("nine")
            Text("ten")
            Text("eleven")
        }
    }
    let blockedViews: some View = view {
        do {
            Text("one")
            Text("two")
            Text("three")
            Text("four")
            Text("five")
        }
        do {
            Text("six")
            Text("seven")
            Text("eight")
            Text("nine")
            Text("ten")
            Text("eleven")
        }
    }
    print(type(of: groupedViews))
    print(type(of: blockedViews))
}
