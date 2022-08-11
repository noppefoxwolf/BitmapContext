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
    
    func testRGBA2() throws {
        var color = RGBAColor(red: 255, green: 255, blue: 255, alpha: 255)
        color.red = 0
        XCTAssertEqual(color.red, 0)
        color.green = 0
        XCTAssertEqual(color.green, 0)
        color.blue = 0
        XCTAssertEqual(color.blue, 0)
        color.alpha = 0
        XCTAssertEqual(color.alpha, 0)
    }
    
    func testRGBA3() throws {
        var color = RGBAColor(red: 255, green: 255, blue: 255, alpha: 255)
        color.red = 128
        XCTAssertEqual(color.red, 128)
        color.green = 128
        XCTAssertEqual(color.green, 128)
        color.blue = 128
        XCTAssertEqual(color.blue, 128)
        color.alpha = 128
        XCTAssertEqual(color.alpha, 128)
    }
    
    func testRGBAIncrement() {
        let color = RGBAColor(red: 255, green: 255, blue: 255, alpha: 255)
        let diff = RGBAColor(red: 0, green: 0, blue: 0, alpha: 0)
        XCTAssertEqual(color.next(), diff)
    }
    
    func testGrayIncrement() {
        let color = GrayColor(gray: 255)
        let diff = GrayColor(gray: 0)
        XCTAssertEqual(color.next(), diff)
    }
}


