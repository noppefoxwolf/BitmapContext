
import CoreGraphics

public protocol Color: Equatable {
    associatedtype ComponentType
    var cgColor: CGColor { get }
}

public struct RGBAColor: Color {
    public typealias ComponentType = UInt8
    public var red, green, blue, alpha: ComponentType
    
    public init(
        red: ComponentType,
        green: ComponentType,
        blue: ComponentType,
        alpha: ComponentType
    ) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public var cgColor: CGColor {
        CGColor(
            srgbRed: Double(red) / Double(ComponentType.max),
            green: Double(green) / Double(ComponentType.max),
            blue: Double(blue) / Double(ComponentType.max),
            alpha: Double(alpha) / Double(ComponentType.max)
        )
    }
}

public struct GrayColor: Color {
    public typealias ComponentType = UInt8
    public var gray: ComponentType
    
    public init(gray: ComponentType) {
        self.gray = gray
    }
    
    public var cgColor: CGColor {
        CGColor(
            gray: Double(gray) / Double(ComponentType.max),
            alpha: 1
        )
    }
}
