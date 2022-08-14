import XCTest
import CoreGraphics

final class MeasureTests: XCTestCase {
    func testSingleContextLayer() {
        measure(metrics: [XCTMemoryMetric(), XCTClockMetric()]) {
            let context = CGContext(data: nil, width: 1024, height: 1024, bitsPerComponent: 8, bytesPerRow: 4 * 1024, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
            for _ in 0..<1000 {
                let layer = CGLayer(context, size: CGSize(width: 1024, height: 1024), auxiliaryInfo: nil)!
                context.draw(layer, in: CGRect(x: 0, y: 0, width: 1024, height: 1024))
            }
            let image = context.makeImage()!
        }
    }
    
    func testMultipleContextLayer() {
        measure(metrics: [XCTMemoryMetric(), XCTClockMetric()]) {
            let context = CGContext(data: nil, width: 1024, height: 1024, bitsPerComponent: 8, bytesPerRow: 4 * 1024, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
            for _ in 0..<1000 {
                let layerContext = CGContext(data: nil, width: 1024, height: 1024, bitsPerComponent: 8, bytesPerRow: 4 * 1024, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
                let layer = CGLayer(layerContext, size: CGSize(width: 1024, height: 1024), auxiliaryInfo: nil)!
                context.draw(layer, in: CGRect(x: 0, y: 0, width: 1024, height: 1024))
            }
            let image = context.makeImage()!
        }
    }
}
