import CoreGraphics

extension BitmapContext {
    public func addPath(_ path: CGPath) {
        context.addPath(path)
    }
    
    public func setStrokeColor(_ color: CGColor) {
        context.setStrokeColor(color)
    }
    
    public func strokePath() {
        context.strokePath()
    }
    
    public func setFillColor(red: Double, green: Double, blue: Double, alpha: Double) where ColorSpaceType == RGBAColorSpace {
        context.setFillColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func setFillColor(gray: Double, alpha: Double) where ColorSpaceType == GrayColorSpace {
        context.setFillColor(gray: gray, alpha: alpha)
    }
    
    public func fillPath(using: CGPathFillRule = .winding) {
        context.fillPath(using: using)
    }
    
    public func draw(_ image: BitmapImage, in rect: Rect, byTiling: Bool = false) {
        context.draw(image.image, in: rect.cgRect, byTiling: byTiling)
    }
    
    public func draw(_ layer: BitmapLayer<ColorSpaceType>, at point: Point) {
        context.draw(layer.layer, at: point.cgPoint)
    }
    
    public func makeImage() -> BitmapImage? {
        context.makeImage().map(BitmapImage.init(image:))
    }
}
