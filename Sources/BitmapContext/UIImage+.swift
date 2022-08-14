#if canImport(UIKit)
import UIKit

extension UIImage {
    public convenience init(bitmap: BitmapImage) {
        self.init(cgImage: bitmap.image)
    }
    
    public convenience init(bitmap: BitmapImage, scale: Double, orientation: UIImage.Orientation) {
        self.init(cgImage: bitmap.image, scale: scale, orientation: orientation)
    }
}
#endif

#if canImport(CoreImage)
import CoreImage

extension CIImage {
    public convenience init(bitmap: BitmapImage) {
        self.init(cgImage: bitmap.image)
    }
}
#endif
