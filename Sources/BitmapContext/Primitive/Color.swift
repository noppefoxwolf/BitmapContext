
import CoreGraphics

public protocol Color: Equatable {
    associatedtype ComponentType
    
    var cgColor: CGColor { get }
    
    func next() -> Self
}

public struct RGBAColor: Color {
    public typealias ComponentType = UInt8
    var rawValue: UInt32
    
    public var red: ComponentType {
        get { UInt8((rawValue & 0xFF000000) >> 24) }
        set { rawValue = rawValue & 0x00FFFFFF | (UInt32(newValue) << 24) }
    }
    public var green: ComponentType {
        get { UInt8((rawValue & 0x00FF0000) >> 16) }
        set { rawValue = rawValue & 0xFF00FFFF | (UInt32(newValue) << 16) }
    }
    public var blue: ComponentType {
        get { UInt8((rawValue & 0x0000FF00) >> 8) }
        set { rawValue = rawValue & 0xFFFF00FF | (UInt32(newValue) << 8) }
    }
    public var alpha: ComponentType {
        get { UInt8((rawValue & 0x000000FF) >> 0) }
        set { rawValue = rawValue & 0xFFFFFF00 | (UInt32(newValue) << 0) }
    }
    
    public init(
        red: ComponentType,
        green: ComponentType,
        blue: ComponentType,
        alpha: ComponentType
    ) {
        self.rawValue = 0x00000000
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
    
    public func next() -> RGBAColor {
        var color = self
        color.rawValue = color.rawValue &+ 1
        return color
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
    
    public func next() -> GrayColor {
        var color = self
        color.gray = color.gray &+ 1
        return color
    }
}
