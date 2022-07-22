//
//  EmptyBody.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

public struct EmptyBody: Body {
    public let isEmpty = true
    public func encode() throws -> Data {
        Data()
    }
}
