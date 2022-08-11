import XCTest
@testable import BitmapContext

final class ColorTests: XCTestCase {
    func testRGBA() throws {
        var color = RGBAColor(red: 0, green: 0, blue: 0, alpha: 0)
        color.red = 255
        XCTAssertEqual(color.red, 255)
        color.green = 255
        XCTAssertEqual(color.green, 255)
        color.blue = 255
        XCTAssertEqual(color.blue, 255)
        color.alpha = 255
        XCTAssertEqual(color.alpha, 255)
    }
    
    func testRGBAIncrement() {
        let color = RGBAColor(red: 255, green: 255, blue: 255, alpha: 255)
        let diff = RGBAColor(red: 0, green: 0, blue: 0, alpha: 0)
        XCTAssertEqual(color.next(), diff)
    }
}


