//
//  Body.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

public protocol Body {
    var isEmpty: Bool { get }
    var contentType: String? { get }
    func encode() throws -> Data
}

extension Body {
    public var isEmpty: Bool { false }
    public var contentType: String? { nil }
}
