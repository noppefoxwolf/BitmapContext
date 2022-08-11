import CoreGraphics

public struct BitmapLayer<ColorSpaceType: ColorSpace> {
    let layer: CGLayer
    public var width: Int { Int(layer.size.width) }
    public var height: Int { Int(layer.size.height) }
    
    public init(context: BitmapContext<ColorSpaceType>) {
        let size = CGSize(width: context.width, height: context.height)
        self.layer = CGLayer(context.context, size: size, auxiliaryInfo: nil)!
    }
    
    var context: BitmapContext<ColorSpaceType> {
        BitmapContext<ColorSpaceType>(context: layer.context!)
    }
}

