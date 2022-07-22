//
//  JSONBody.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

private let encoder = JSONEncoder()

public struct JSONBody<Value: Encodable>: Body {

    public var value: Value
    public var contentType: String? {
        if isArray {
            return "application/json; format=array"
        } else {
            return "application/json"
        }
    }

    public var isArray: Bool {
        let mirror = Mirror(reflecting: value as Any)
        switch mirror.displayStyle {
        case .collection?:
            return true
        default:
            return false
        }
    }

    public init(_ value: Value) {
        self.value = value
    }

    public func encode() throws -> Data {
        try encoder.encode(value)
    }
}
