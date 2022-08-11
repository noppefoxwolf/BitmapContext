import XCTest
@testable import BitmapContext
import CoreGraphics

final class CodableTests: XCTestCase {
    func testColorCodable() throws {
        let context = BitmapContext<RGBAColorSpace>(width: 16, height: 16)
        context.setFillColor(RGBAColor(red: .max, green: .min, blue: .min, alpha: .max))
        context.addPath(CGPath(rect: CGRect(x: 0, y: 0, width: 8, height: 8), transform: nil))
        context.fillPath()
        let image1 = UIImage(bitmap: context.makeImage()!)
        let data = try JSONEncoder().encode(context)
        let context2 = try JSONDecoder().decode(BitmapContext<RGBAColorSpace>.self, from: data)
        let image2 = UIImage(bitmap: context2.makeImage()!)
        XCTAssertEqual(image1.pngData(), image2.pngData())
    }
    
    func testGrayCodable() throws {
        let context = BitmapContext<GrayColorSpace>(width: 16, height: 16)
        context.setFillColor(GrayColor(gray: .max))
        context.addPath(CGPath(rect: CGRect(x: 0, y: 0, width: 8, height: 8), transform: nil))
        context.fillPath()
        let image1 = UIImage(bitmap: context.makeImage()!)
        let data = try JSONEncoder().encode(context)
        let context2 = try JSONDecoder().decode(BitmapContext<GrayColorSpace>.self, from: data)
        let image2 = UIImage(bitmap: context2.makeImage()!)
        XCTAssertEqual(image1.pngData(), image2.pngData())
    }
}


