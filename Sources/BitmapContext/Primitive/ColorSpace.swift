import CoreGraphics

public protocol ColorSpace {
    associatedtype PixelType: Pixel
    static var colorSpace: CGColorSpace { get }
}

public struct RGBAColorSpace: ColorSpace {
    public typealias PixelType = RGBAPixel
    public static var colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
}

public struct GrayColorSpace: ColorSpace {
    public typealias PixelType = MonochromePixel
    public static var colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
}
