
public protocol Pixel: Equatable {
    associatedtype ComponentType
}

public struct RGBAPixel: Pixel {
    public typealias ComponentType = UInt8
    public var red, green, blue, alpha: ComponentType
    
    public init(
        red: RGBAPixel.ComponentType,
        green: RGBAPixel.ComponentType,
        blue: RGBAPixel.ComponentType,
        alpha: RGBAPixel.ComponentType
    ) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

public struct MonochromePixel: Pixel {
    public typealias ComponentType = UInt8
    public var gray: ComponentType
    
    public init(gray: MonochromePixel.ComponentType) {
        self.gray = gray
    }
}
