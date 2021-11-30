//
//  Routable.swift
//  
//
//  Created by Rake Yang on 2021/11/30.
//

import Foundation

@propertyWrapper public struct Routable<Value> {
    public var wrappedValue: Value
    
    public init(wrappedValue: Value, url: String) {
        self.wrappedValue = wrappedValue
        QuickRoute.register(url: url, handler: wrappedValue as! RouteHandler)
    }
}

public struct RouteContext {
    var done: ((_ data: Any?) -> Void)?
}

public typealias RouteHandler = (_ ctx: RouteContext) -> Void

protocol RouteRegistration {
    static func register()
}
