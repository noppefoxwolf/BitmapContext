import CoreGraphics

@dynamicMemberLookup
public struct BitmapImage {
    let image: CGImage
    
    @_spi(BitmapExtension)
    public init(image: CGImage) {
        self.image = image
    }
    
    public subscript<S>(dynamicMember keyPath: KeyPath<CGImage, S>) -> S {
        image[keyPath: keyPath]
    }
}
