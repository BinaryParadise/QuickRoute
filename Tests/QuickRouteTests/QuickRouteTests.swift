import XCTest
@testable import QuickRoute

class RouteList: RouteRegistration {
    /*@Routable(url: "qr://com.base.d")
    var faield: RouteHandler = { ctx in
        ctx.done("faield")
    }*/
    @Routable(url: "qr://com.base.d/user/login")
    var login: RouteHandler = { ctx in
        ctx.done("login")
    }
    
    @Routable(url: "qr://com.base.d/user/modify")
    var hello: RouteHandler = { ctx in
        ctx.done("modify")
    }
    
    @Routable(url: "qr://com.base.d/user/login/out")
    var logout: RouteHandler = { ctx in
        ctx.done("out")
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
        QuickRoute.openURL(url: "qr://com.base.d/user") { d, err in
            XCTAssertNotNil(err)
            XCTAssertNil(d)
        }
        QuickRoute.openURL(url: "qr://com.base.d/user/login") { d,err  in
            XCTAssertEqual(d as? String, "login")
        }
        
        QuickRoute.openURL(url: "qr://com.base.d/user/modify") { d, err in
            XCTAssertEqual(d as? String, "modify")
        }
        
        QuickRoute.openURL(url: "qr://com.base.d/user/login/out") { d, err in
            XCTAssertEqual(d as? String, "out")
        }
    }
}
