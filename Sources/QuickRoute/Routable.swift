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
    var finished: ((_ data: Any?, Error?) -> Void)?
    
    func done(_ data: Any? = nil, _ error: Error? = nil) {
        finished?(data, error)
    }
}

public typealias RouteHandler = (_ ctx: RouteContext) -> Void

protocol RouteRegistration {
    static func register()
}

public enum RouteError: Error, CustomStringConvertible {
    case notFound(String)
    
    public var description: String {
        switch self {
        case .notFound(let url):
            return "Can't find route with url: \(url)"
        }
    }
}
