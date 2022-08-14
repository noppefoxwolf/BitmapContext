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
    
    func test32Big() {
        let context = CGContext(data: nil, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGImageByteOrderInfo.order32Big.rawValue)!
        context.setFillColor(red: 0, green: 0, blue: 1, alpha: 1)
        context.addPath(CGPath(rect: CGRect(origin: .zero, size: CGSize(width: 1, height: 1)), transform: nil))
        context.fillPath()
        
        let ctxData = context.data!
        
        // 00 00 FF FF // R G B A
        let color = ctxData.load(as: RGBAColor.self)
        // rawValueはUInt32 = littleEndianなので逆転している
        XCTAssertNotEqual(color.rawValue, 0x0000FFFF)
        struct Value {
            let r,g,b,a: UInt8
        }
        let color2 = ctxData.load(as: Value.self)
        XCTAssertEqual(color2.r, 0)
        XCTAssertEqual(color2.g, 0)
        XCTAssertEqual(color2.b, 255)
        XCTAssertEqual(color2.a, 255)
    }
    
    func test32Little() {
        let context = CGContext(data: nil, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGImageByteOrderInfo.order32Little.rawValue)!
        context.setFillColor(red: 0, green: 0, blue: 1, alpha: 1)
        context.addPath(CGPath(rect: CGRect(origin: .zero, size: CGSize(width: 1, height: 1)), transform: nil))
        context.fillPath()
        
        let ctxData = context.data!
        
        // FF FF 00 00 // A B G R
        let color = ctxData.load(as: RGBAColor.self)
        XCTAssertEqual(color.rawValue, 0x0000FFFF)
        
        struct Value {
            let r,g,b,a: UInt8
        }
        let color2 = ctxData.load(as: Value.self)
        XCTAssertNotEqual(color2.r, 0)
        XCTAssertNotEqual(color2.g, 0)
        XCTAssertNotEqual(color2.b, 255)
        XCTAssertNotEqual(color2.a, 255)
    }
    
    func testEndian() {
        var color = RGBAColor(byteOrder32Big: 0x0000FFFF)
        XCTAssertEqual(color.blue, 0x00)
        color.red = 0xEE
        XCTAssertEqual(color.rawValue, 0x0000FFEE)
    }
    
    func testLoad() {
        // FF FF 00 00 // A B G R
        struct Value1 {
            let a,b,c,d: UInt8
        }
        struct Value2 {
            let a: UInt32
        }
        var data = Data([0x00, 0x00, 0xFF, 0xFF])
        //UnsafeMutableRawPointer
        data.withUnsafeBytes { pointer in
            // リトルエンディアンで取得されるので、UInt32とかにすると値がずれる
            let value1 = pointer.load(as: Value1.self)
            XCTAssertEqual(value1.a, 0)
            XCTAssertEqual(value1.b, 0)
            XCTAssertEqual(value1.c, 255)
            XCTAssertEqual(value1.d, 255)
            let value2 = pointer.load(as: Value2.self)
            XCTAssertEqual(value2.a, 0xFFFF0000)
        }
    }
}


