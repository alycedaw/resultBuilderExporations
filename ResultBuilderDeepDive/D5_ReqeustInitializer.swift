//
//  D5_ReqeustInitializer.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

typealias QueryItem = (String, QueryEncodable)

precedencegroup QueryItemPrecedence {
    higherThan: NilCoalescingPrecedence
    associativity: right
}

infix operator => : QueryItemPrecedence

extension String {
    static func => (lhs: String, rhs: QueryEncodable) -> QueryItem {
        (lhs, rhs)
    }

    static func => (lhs: String, rhs: QueryEncodable?) -> QueryItem? {
        rhs.map { (lhs, $0) }
    }
}

protocol QueryEncodable {
    var queryEncoding: String { get }
}

extension String: QueryEncodable {
    var queryEncoding: String { self }
}

extension Int: QueryEncodable {
    var queryEncoding: String { "\(self)"}
}

extension Bool: QueryEncodable {
    var queryEncoding: String { "\(self)" }
}

extension Array: QueryEncodable where Element: QueryEncodable {
    var queryEncoding: String {
        map(\.queryEncoding).joined(separator: ",")
    }
}

extension RawRepresentable where RawValue: QueryEncodable {
    var queryEncoding: String { return rawValue.queryEncoding }
}

enum Size: String, QueryEncodable {
    case small, medium, big
}

func d5_requestInitializer() {
    let example1 = "name" => "bobby"
    print(example1)
    let example2 = "id" => 23
    print(example2)
    let example3 = "ids" => [1, 2, 3]
    print(example3)
    let example4 = "size" => Size.big
    print(example4)
}
