import CoreGraphics
import Foundation

public struct BitmapContext<ColorSpaceType> where ColorSpaceType: ColorSpace {
    let context: CGContext
    public var width: Int { context.width }
    public var height: Int { context.height }
    
    public init(data: Data? = nil, width: Int, height: Int) where ColorSpaceType == RGBAColorSpace {
        let context = CGContext(
            data: data.map(NSMutableData.init(data:))?.mutableBytes,
            width: width,
            height: height,
            bitsPerComponent: ColorSpaceType.ColorType.ComponentType.bitWidth,
            bytesPerRow: MemoryLayout<ColorSpaceType.ColorType>.size * width,
            space: ColorSpaceType.colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGImageByteOrderInfo.order32Big.rawValue | CGImagePixelFormatInfo.packed.rawValue
        )!
        context.setAllowsAntialiasing(false)
        context.interpolationQuality = .none
        self.init(context: context)
    }
    
    public init(data: Data? = nil, width: Int, height: Int) where ColorSpaceType == GrayColorSpace {
        let context = CGContext(
            data: data.map(NSMutableData.init(data:))?.mutableBytes,
            width: width,
            height: height,
            bitsPerComponent: ColorSpaceType.ColorType.ComponentType.bitWidth,
            bytesPerRow: MemoryLayout<ColorSpaceType.ColorType>.size * width,
            space: ColorSpaceType.colorSpace,
            bitmapInfo: CGImageAlphaInfo.none.rawValue | CGImageByteOrderInfo.orderDefault.rawValue | CGImagePixelFormatInfo.packed.rawValue
        )!
        context.setAllowsAntialiasing(false)
        context.interpolationQuality = .none
        self.init(context: context)
    }
    
    @_spi(BitmapExtension)
    public init(context: CGContext) {
        self.context = context
    }
}


