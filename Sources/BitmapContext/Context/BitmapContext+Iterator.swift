import CoreGraphics

extension BitmapContext {
    public var pixels: PixelSequence<ColorSpaceType.ColorType> {
        PixelSequence<ColorSpaceType.ColorType>(context: context)
    }
}

public struct PixelSequence<T: Color>: Sequence {
    let context: CGContext
    
    public func makeIterator() -> PixelIterator<T> {
        Self.Iterator(context)
    }
}

public struct PixelIterator<Element: Color>: IteratorProtocol {
    private let context: CGContext
    private var currentOffset: Int

    init(_ context: CGContext) {
        self.context = context
        self.currentOffset = 0
    }

    mutating public func next() -> Element? {
        guard currentOffset < context.dataLength else { return nil }
        let pixel: Element? = context[byteOffset: currentOffset]
        currentOffset += MemoryLayout<Element>.size
        return pixel
    }
}

