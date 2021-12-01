import Foundation
public struct QuickRoute {
    private static var routes: [String : RouteNode] = [:]
    
    public static func register(url: String, handler: @escaping RouteHandler) {
        search(url: url).handler = handler
    }
    
    static func search(url: String) -> RouteNode {
        if let u = URL(string: url), u.isCompliance {
            if let root = routes[u.scheme!] {
                var node = root[u.host!]
                for path in u.pathComponents {
                    node = node[path]
                }
                return node
            } else {
                routes[u.scheme!] = RouteNode()
            }
            return search(url: url)
        } else {
            fatalError("\(url) not compliance（e.g qr://com.base.d/test）")
        }
    }
    
    public static func openURL(url: String, completion: @escaping (Any?, Error?) -> Void) {
        if let handler = search(url: url).handler {
            handler(RouteContext(finished: completion))
        } else {
            completion(nil, RouteError.notFound(url))
        }
    }
}

extension URL {
    
    /// 是否符合路由规范
    var isCompliance: Bool {
        return scheme != nil && host != nil && pathComponents.count > 0
    }
}
