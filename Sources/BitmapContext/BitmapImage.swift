import CoreGraphics

public struct BitmapImage {
    let image: CGImage
    
    @_spi(BitmapExtension)
    public init(image: CGImage) {
        self.image = image
    }
}
