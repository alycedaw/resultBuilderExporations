//
//  D6_RequestInitializer.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

@resultBuilder
enum QueryItemsBuilder {
    static func buildExpression(_ expression: QueryItem) -> [QueryItem] {
        [expression]
    }

    static func buildBlock(_ components: [QueryItem]...) -> [QueryItem] {
        Array(components.joined())
    }

    static func buildOptional(_ component: [QueryItem]?) -> [QueryItem] {
        component ?? []
    }

    static func buildEither(first component: [QueryItem]) -> [QueryItem] {
        component
    }

    static func buildEither(second component: [QueryItem]) -> [QueryItem] {
        component
    }

    static func buildArray(_ components: [[QueryItem]]) -> [QueryItem] {
        Array(components.joined())
    }

    static func buildFinalResult(_ component: [QueryItem]) -> [URLQueryItem]? {
        component.isEmpty ? nil : component.map {
            URLQueryItem(name: $0.0, value: $0.1.queryEncoding)
        }
    }
}

func d6_requestInitializer() {
    let request1 = Request(path: "users") {
        "ids" => [3, 4, 5]
        "token" => "eyJhbO9.eyJy3NzDAxL0.Kp8inHnx5EtiThU"
    }
    print(request1)
    let ids = "ids" => [3, 4, 5]
    let request2 = Request(path: "users/\(123)") {
        ids
        if request1.path.count > 3 {
            "value" => true
        }
        for n in 5...10 {
            "other\(n)" => "\(n)"
        }
    }
    print(request2)
}

/// Why go through all the trouble to make this initializer
/// It allows me to define an endpoint in one line of code.
/// I also created helper methods that let me send it and
/// return it as publisher or a decoded response with async
/// ```
/// func getListingsOfUser(userId: Int) -> AnyPublisher<[Listing], LoadError> {
///    Request {
///        "user_id" => userId
///    }
///    .send(with: loader)
///    .decode([Listing].self)
/// }
///
/// func getListingsOfUser(userId: Int) async throws -> [Listing] {
///    Request {
///        "user_id" => userId
///    }
///    .send(with: loader)
///    .decode([Listing].self)
/// }
///
/// ```
