//
//  D4_RequestInitializer.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

/// Instead of using a @resultBuilder to build the entire request, it works better to just use it to build the query items.
/// Becuase the project I'm working on uses JSON 99% of the time I'll also just pass an encodable type directly into the constructor and assume that it's a JSONBody, and infer the Method by creating an initializer with a named parameter with for each commonly used method.
///

extension Request {

    init(method: Method = .get,
         body: Body = EmptyBody(),
         path: String = "",
         @QueryItemsBuilder queryItems: () -> [URLQueryItem]? = { nil }) {
        self.init()
        self.method = method
        self.body = body
        self.path = path
        self.queryItems = queryItems()
    }

    init<Body: Encodable>(post body: Body,
                          path: String = "",
                          @QueryItemsBuilder queryItems: () -> [URLQueryItem]? = { nil }) {
        self.init()
        self.body = JSONBody(body)
        self.path = path
        self.method = .post
        self.queryItems = queryItems()
    }

    init<Body: Encodable>(put body: Body,
                          path: String = "",
                          @QueryItemsBuilder queryItems: () -> [URLQueryItem]? = { nil }) {
        self.init()
        self.body = JSONBody(body)
        self.path = path
        self.method = .put
    }

    init<Body: Encodable>(delete body: Body,
                          path: String = "",
                          @QueryItemsBuilder queryItems: () -> [URLQueryItem]? = { nil }) {
        self.init()
        self.body = JSONBody(body)
        self.path = path
        self.method = .delete
    }
}

func d4_requestInitializer() -> Request {
    let id = 123
    let jwt = "eyJhbO9.eyJy3NzDAxL0.Kp8inHnx5EtiThU"
    let resourceUpdate = ResourceUpdate()

    return Request(put: resourceUpdate, path: "resource/\(id)") {
        "platform" => "iOS"
        "token" => jwt
    }
}
