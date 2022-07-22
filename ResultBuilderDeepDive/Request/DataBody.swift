//
//  DataBody.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

public struct DataBody: Body {
    private let data: Data

    public var isEmpty: Bool { data.isEmpty }
    public var contentType: String?

    public init(_ data: Data, contentType: String) {
        self.data = data
        self.contentType = contentType
    }

    public func encode() throws -> Data { data }
}
