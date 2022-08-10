import CoreGraphics
import Foundation

public struct Size: Codable, Equatable, Hashable {
    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    public var width: Int
    public var height: Int
}

extension Size {
    public static let zero: Size = Size(width: 0, height: 0)
}

extension Size {
    public init(_ size: CGSize) {
        self.width = Int(size.width)
        self.height = Int(size.height)
    }

    public var cgSize: CGSize {
        CGSize(width: width, height: height)
    }
}

extension Size: CustomStringConvertible {
    public var description: String { "\(width) x \(height)" }
}
