import CoreGraphics
import Foundation

extension BitmapContext: Codable {
    enum CodingKeys: CodingKey {
        case data
        case width
        case height
        case bitmapInfo
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode(Data.self, forKey: .data)
        let width = try container.decode(Int.self, forKey: .width)
        let height = try container.decode(Int.self, forKey: .height)
        let bitmapInfo = try container.decode(UInt32.self, forKey: .bitmapInfo)
        self.context = CGContext(
            data: NSMutableData(data: data).mutableBytes,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: MemoryLayout<ColorSpaceType.ColorType>.size * width,
            space: ColorSpaceType.colorSpace,
            bitmapInfo: bitmapInfo
        )!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(context.foundationData, forKey: .data)
        try container.encode(context.width, forKey: .width)
        try container.encode(context.height, forKey: .height)
        try container.encode(context.bitmapInfo.rawValue, forKey: .bitmapInfo)
    }
}
