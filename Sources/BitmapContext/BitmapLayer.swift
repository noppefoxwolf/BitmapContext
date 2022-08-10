import CoreGraphics

public struct BitmapLayer<ColorSpaceType: ColorSpace> {
    let layer: CGLayer
    
    public init(context: BitmapContext<ColorSpaceType>, size: CGSize) {
        self.layer = CGLayer(context.context, size: size, auxiliaryInfo: nil)!
    }
    
    public var context: BitmapContext<ColorSpaceType> {
        BitmapContext<ColorSpaceType>(context: layer.context!)
    }
}
