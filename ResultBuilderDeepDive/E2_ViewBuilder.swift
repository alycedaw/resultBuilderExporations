////
////  E2_ViewBuilder.swift
////  ResultBuilderDeepDive
////
////  Created by Work on 7/19/22.
////
//
//import SwiftUI
//
//extension ViewBuilder {
//    static func buildBlock(_ v1: any View, _ v2: any View, _ v3: any View, _ v4: any View, _ v5: any View, _ v6: any View, _ v7: any View, _ v8: any View, _ v9: any View, _ v10: any View, _ components: any View...) -> some View {
//        let components = [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10] + components
//        return buildBlock(Views(views: components))
//    }
//}
//
//struct Views: View {
//    var views: [any View]
//
//    var unboxed: [AnyView] {
//        views.map { AnyView($0) }
//    }
//
//    var body: some View {
//        ForEach(Array(unboxed.enumerated()), id: \.offset) { item in
//            item.element
//        }
//    }
//}
//
//func e2_viewBuilder() {
//    struct MyView: View {
//        var body: some View {
//            VStack {
//                Text("1")
//                Text("2")
//                Text("3")
//                Text("4")
//                Text("5")
//                Text("6")
//                Text("7")
//                Text("8")
//                Text("9")
//                Text("10")
//                Text("11")
//                Text("12")
//                Text("13")
//                Text("14")
//                Text("15")
//            }
//        }
//    }
//    print(type(of: MyView().body))
//}
