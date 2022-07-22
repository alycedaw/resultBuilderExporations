//
//  D1_QueryBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

/// We can already build a request imparatively
///
struct ResourceUpdate: Encodable { /* ... */ }

func d1_requestInitializer() {
    let id = 123
    let jwt = "eyJhbO9.eyJy3NzDAxL0.Kp8inHnx5EtiThU"
    struct ResourceUpdate: Encodable { /* ... */ }
    let resourceUpdate = ResourceUpdate()

    var request = Request()
    request.method = .put
    request.path = "resource/\(id)"
    request.body = JSONBody(resourceUpdate)
    request.queryItems = [
        URLQueryItem(name: "platform", value: "iOS"),
        URLQueryItem(name: "token", value: jwt)
    ]
}
