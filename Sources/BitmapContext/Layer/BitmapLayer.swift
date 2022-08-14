import CoreGraphics

public struct BitmapLayer<ColorSpaceType: ColorSpace> {
    let layer: CGLayer
    public var width: Int { Int(layer.size.width) }
    public var height: Int { Int(layer.size.height) }
    
    enum CodingKeys: CodingKey {
        case data
        case width
        case height
    }
    
    public init(context: BitmapContext<ColorSpaceType>) {
        let size = CGSize(width: context.width, height: context.height)
        self.layer = CGLayer(context.context, size: size, auxiliaryInfo: nil)!
    }
    
    var context: BitmapContext<ColorSpaceType> {
        BitmapContext<ColorSpaceType>(context: layer.context!)
    }
}

import Foundation

extension BitmapLayer: Codable where Self.ColorSpaceType == GrayColorSpace {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode(Data.self, forKey: .data)
        let width = try container.decode(Int.self, forKey: .width)
        let height = try container.decode(Int.self, forKey: .height)
        let tmpContext = BitmapContext<GrayColorSpace>(data: data, width: width, height: height)
        let context = decoder.userInfo[.decodeBitmapContext] as? BitmapContext<ColorSpaceType> ?? BitmapContext<GrayColorSpace>(width: width, height: height)
        self.init(context: context)
        draw(tmpContext.makeImage()!, in: Rect(x: 0, y: 0, width: width, height: height))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let tmpContext = BitmapContext<GrayColorSpace>(width: width, height: height)
        tmpContext.draw(self, at: .zero)
        let data = tmpContext.context.foundationData
        try container.encode(data, forKey: .data)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
    }
}
