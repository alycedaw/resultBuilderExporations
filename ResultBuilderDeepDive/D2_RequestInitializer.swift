//
//  D2_RequestInitializer.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

/// We could also add a convenience initializer that looks like this:

extension Request {
    init(method: Method, path: String, body: any Body, queryItems: [URLQueryItem]?) {
        self.init()
        // ...
    }
}

func d2_requestInitializer() {
    let id = 123
    let jwt = "eyJhbO9.eyJy3NzDAxL0.Kp8inHnx5EtiThU"
    let resourceUpdate = ResourceUpdate()

    let _ =
    Request(method: .put,
            path: "resource/\(id)",
            body: JSONBody(resourceUpdate),
            queryItems: [
        URLQueryItem(name: "platform", value: "iOS"),
        URLQueryItem(name: "token", value: jwt)
    ])
}

