import CoreGraphics

extension BitmapContext {
    public var pixels: PixelSequence<ColorSpaceType.PixelType> {
        PixelSequence<ColorSpaceType.PixelType>(context: context)
    }
}

public struct PixelSequence<T: Pixel>: Sequence {
    let context: CGContext
    
    public func makeIterator() -> PixelIterator<T> {
        Self.Iterator(context)
    }
}

public struct PixelIterator<Element: Pixel>: IteratorProtocol {
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

