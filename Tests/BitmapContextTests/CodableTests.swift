import XCTest
@testable import BitmapContext
import CoreGraphics

#if canImport(UIKit)
import UIKit

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
    
    func testLayerCodable() throws {
        let context = BitmapContext<GrayColorSpace>(width: 16, height: 16)
        let layer = BitmapLayer<GrayColorSpace>(context: context)
        layer.setFillColor(GrayColor(gray: .max))
        layer.addPath(CGPath(rect: CGRect(x: 0, y: 0, width: 8, height: 8), transform: nil))
        layer.fillPath()
        let data = try JSONEncoder().encode(layer)
        XCTAssertEqual(data.count, 458)
        let decodedLayer = try JSONDecoder().decode(BitmapLayer<GrayColorSpace>.self, from: data)
        
        let layerImage = UIImage(bitmap: layer.makeImage()!)
        let decodedLayerImage = UIImage(bitmap: decodedLayer.makeImage()!)
        XCTAssertEqual(
            decodedLayerImage.pngData()!,
            layerImage.pngData()!
        )
    }
    
    func testDataCodable() throws {
        var rawData = Data(repeating: 0, count: 1024)
        for i in 0..<1024 {
            rawData[i] = UInt8.random(in: UInt8.min..<UInt8.max)
        }
        let data = try JSONEncoder().encode(rawData)
        let decodedData = try JSONDecoder().decode(Data.self, from: data)
        XCTAssertEqual(rawData, decodedData)
        XCTAssertGreaterThan(data.count, rawData.count)
    }
}
#endif
