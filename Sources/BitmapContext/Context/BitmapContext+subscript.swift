import CoreGraphics

extension BitmapContext {
    public subscript(point point: Point) -> ColorSpaceType.ColorType? {
        get { context[point: point.simd] }
        set { context[point: point.simd] = newValue }
    }
    
    public subscript(index index: Int) -> ColorSpaceType.ColorType? {
        get { context[index: index] }
        set { context[index: index] = newValue }
    }
}

extension CGContext {
    @inlinable
    subscript<T: Color>(byteOffset offset: Int) -> T? {
        get {
            guard offset < dataLength else { return nil }
            return data?.load(
                fromByteOffset: offset,
                as: T.self
            )
        }
        set {
            data?.storeBytes(
                of: newValue!,
                toByteOffset: offset,
                as: T.self
            )
        }
    }
}

extension CGContext {
    @inlinable
    subscript<T: Color>(index index: Int) -> T? {
        get {
            self[byteOffset: index * MemoryLayout<T>.size]
        }
        set {
            self[byteOffset: index * MemoryLayout<T>.size] = newValue
        }
    }
}

extension CGContext {
    @inlinable
    subscript<T: Color>(point point: SIMD2<Int>) -> T? {
        get {
            self[byteOffset: offset(x: point.x, y: point.y)]
        }
        set {
            self[byteOffset: offset(x: point.x, y: point.y)] = newValue
        }
    }
}
