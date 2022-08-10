import CoreGraphics
import Foundation

extension CGContext {
    @inlinable
    var dataLength: Int {
        height * bytesPerRow
    }
}

extension CGContext {
    @inlinable
    func point(at offset: Int) -> (x: Int, y: Int) {
        (offset % width, offset / width)
    }

    @inlinable
    func offset(x: Int, y: Int) -> Int {
        let bytesPerPixel = bitsPerPixel / bitsPerComponent
        return (bytesPerRow * (height - y - 1)) + (x * bytesPerPixel)
    }
}

extension CGContext {
    var foundationData: Data {
        Data(bytesNoCopy: data!, count: dataLength, deallocator: .none)
    }
}
