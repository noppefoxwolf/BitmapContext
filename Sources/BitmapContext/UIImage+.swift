import UIKit

extension UIImage {
    public convenience init(bitmap: BitmapImage) {
        self.init(cgImage: bitmap.image)
    }
}

extension CIImage {
    public convenience init(bitmap: BitmapImage) {
        self.init(cgImage: bitmap.image)
    }
}
