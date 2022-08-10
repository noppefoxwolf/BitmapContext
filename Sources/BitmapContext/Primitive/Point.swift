import CoreGraphics
import Foundation
import Accelerate

public struct Point: Codable, Equatable, Hashable {
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public var x: Int
    public var y: Int
}

extension Point {
    public init(_ cgPoint: CGPoint) {
        self.init(x: Int(cgPoint.x.rounded(.down)), y: Int(cgPoint.y.rounded(.down)))
    }

    public var cgPoint: CGPoint {
        CGPoint(x: x, y: y)
    }

    public var simd: SIMD2<Int> {
        SIMD2<Int>(x: x, y: y)
    }
}

extension Point {
    public static let zero: Point = Point(x: 0, y: 0)
}

extension Point {
    public func distance(from: Point) -> Size {
        Size(
            width: from.x - self.x,
            height: from.y - self.y
        )
    }
}

extension Point {
    public static func + (lhs: Self, rhs: Self) -> Self {
        Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
