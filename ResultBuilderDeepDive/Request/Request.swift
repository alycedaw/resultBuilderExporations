//
//  Request.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/18/22.
//

import Foundation

public struct Request {
    private var urlComponents: URLComponents
    public var method: Method = .get
    public var headers: [String: String] = [:]
    public var body: Body = EmptyBody()

    public init() {
        urlComponents = URLComponents()
        headers["client"] = "ios"
    }

    public init(url: URL) {
        urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    }
}

// MARK: - Convenience Properties

public extension Request {
    var url: URL? {
        urlComponents.url
    }

    var queryItems: [URLQueryItem]? {
        get { urlComponents.queryItems }
        set { urlComponents.queryItems = newValue }
    }

    var scheme: String? {
        get { urlComponents.scheme }
        set { urlComponents.scheme = newValue }
    }

    var host: String? {
        get { urlComponents.host }
        set { urlComponents.host = newValue }
    }

    var port: Int? {
        get { urlComponents.port }
        set { urlComponents.port = newValue }
    }

    var path: String {
        get { urlComponents.path }
        set { urlComponents.path = newValue }
    }
}
