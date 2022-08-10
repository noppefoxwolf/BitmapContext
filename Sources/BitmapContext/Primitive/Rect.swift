import CoreGraphics

public struct Rect: Codable, Equatable {
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    public var origin: Point
    public var size: Size
}

extension Rect {
    public static let zero: Rect = Rect(origin: .zero, size: .zero)
}

extension Rect {
    public init(x: Int, y: Int, width: Int, height: Int) {
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }

    public init(_ cgRect: CGRect) {
        self.init(origin: Point(cgRect.origin), size: Size(cgRect.size))
    }

    public var cgRect: CGRect {
        CGRect(origin: origin.cgPoint, size: size.cgSize)
    }
}
