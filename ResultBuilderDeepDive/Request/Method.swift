//
//  Method.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

public struct Method {
    public static let get = Method(rawValue: "GET")
    public static let post = Method(rawValue: "POST")
    public static let put = Method(rawValue: "PUT")
    public static let delete = Method(rawValue: "DELETE")

    public let rawValue: String
}
