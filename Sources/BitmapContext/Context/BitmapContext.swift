import CoreGraphics

public struct BitmapContext<ColorSpaceType> where ColorSpaceType: ColorSpace {
    let context: CGContext
    public var width: Int { context.width }
    public var height: Int { context.width }
    
    public init(width: Int, height: Int) where ColorSpaceType == RGBAColorSpace {
        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: ColorSpaceType.ColorType.ComponentType.bitWidth,
            bytesPerRow: MemoryLayout<ColorSpaceType.ColorType>.size * width,
            space: ColorSpaceType.colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
        )!
        context.setAllowsAntialiasing(false)
        context.interpolationQuality = .none
        self.init(context: context)
    }
    
    public init(width: Int, height: Int) where ColorSpaceType == GrayColorSpace {
        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: ColorSpaceType.ColorType.ComponentType.bitWidth,
            bytesPerRow: MemoryLayout<ColorSpaceType.ColorType>.size * width,
            space: ColorSpaceType.colorSpace,
            bitmapInfo: CGImageAlphaInfo.none.rawValue
        )!
        self.init(context: context)
    }
    
    internal init(context: CGContext) {
        context.setAllowsAntialiasing(false)
        context.interpolationQuality = .none
        self.context = context
    }
}


