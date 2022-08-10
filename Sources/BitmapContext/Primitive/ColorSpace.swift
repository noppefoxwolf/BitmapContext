import CoreGraphics

public protocol ColorSpace {
    associatedtype ColorType: Color
    static var colorSpace: CGColorSpace { get }
}

public struct RGBAColorSpace: ColorSpace {
    public typealias ColorType = RGBAColor
    public static var colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
}

public struct GrayColorSpace: ColorSpace {
    public typealias ColorType = GrayColor
    public static var colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
}
