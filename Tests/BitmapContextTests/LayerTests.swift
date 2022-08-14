import XCTest
@testable import BitmapContext

#if canImport(UIKit)
import UIKit

final class LayerTests: XCTestCase {
    func testLayerDraw() {
        let context = BitmapContext<RGBAColorSpace>(width: 16, height: 16)
        let layer = BitmapLayer(context: context)
        layer.setFillColor(RGBAColor(red: 255, green: 0, blue: 0, alpha: 255))
        layer.addPath(CGPath(rect: CGRect(x: 0, y: 0, width: 8, height: 8), transform: nil))
        layer.fillPath()
        let image = UIImage(bitmap: layer.makeImage()!)
        let diff = UIImage(named: "Resource/layer_draw", in: .module, with: nil)!
        XCTAssertEqual(image.pngData()!, diff.pngData()!)
    }
}
#endif
