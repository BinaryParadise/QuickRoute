public struct QuickRoute {
    private static var routes: [String : RouteHandler] = [:]
    
    public static func register(url: String, handler: @escaping RouteHandler) {
        routes[url] = handler
    }
    
    public static func openURL(url: String, completion: @escaping (Any?) -> Void) {
        guard let handler = routes[url] else { return }
        handler(RouteContext(done: completion))
    }
}
