import CoreGraphics

public protocol PathDrawable {
    associatedtype ColorSpaceType: ColorSpace
    func addPath(_ path: CGPath)
    
    func setStrokeColor(_ color: ColorSpaceType.ColorType)
    func strokePath()
    
    func setFillColor(_ color: ColorSpaceType.ColorType)
    func fillPath(using rule: CGPathFillRule)
    
    func draw(_ image: BitmapImage, in rect: Rect, byTiling: Bool)
    func draw(_ layer: BitmapLayer<ColorSpaceType>, at point: Point)
}
