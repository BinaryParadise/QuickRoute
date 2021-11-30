import XCTest
@testable import QuickRoute

class RouteList: RouteRegistration {
    @Routable(url: "qr://hello")
    var hello: RouteHandler = { ctx in
        ctx.done?("Hello,World!")
    }
    
    static func register() {
        _ = RouteList()
    }
}

final class QuickRouteTests: XCTestCase {
    override class func setUp() {
        RouteList.register()
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        QuickRoute.openURL(url: "qr://hello") { d in
            XCTAssertEqual(d as? String, "Hello,World!")
        }
    }
}
