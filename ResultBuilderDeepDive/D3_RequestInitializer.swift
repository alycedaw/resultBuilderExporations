//
//  D3_RequestInitializer.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

/// When deciding to make a builder it's helpful to decide what you want
/// the end result to look like
/// 
/// Let's see what it would look like if we resultBuilder-ify the whole thing
///
/// ```
/// Request {
///    .put
///    Path("resource/\(id)")
///    resourceUpdateBody
///    queryItem {
///        "platform" => "iOS"
///        "token" => jwt
///    }
/// ```
/// That is less typing, but it's a lot less clear what's going on.
/// It's less clear what order the parameters are suppose to be in
/// and the parameters aren't named so you have to pick up on the context.
