
public protocol Pixel: Equatable {
    associatedtype ComponentType
}

public struct RGBAPixel: Pixel {
    public typealias ComponentType = UInt8
    public var red, green, blue, alpha: ComponentType
}

public struct MonochromePixel: Pixel {
    public typealias ComponentType = UInt8
    public var gray: ComponentType
}
