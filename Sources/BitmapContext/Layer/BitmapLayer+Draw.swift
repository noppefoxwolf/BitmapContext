import CoreGraphics

extension BitmapLayer: PathDrawable {
    public func addPath(_ path: CGPath) {
        context.addPath(path)
    }
    
    public func setStrokeColor(_ color: ColorSpaceType.ColorType) {
        context.setStrokeColor(color)
    }
    
    public func strokePath() {
        context.strokePath()
    }
    
    public func setFillColor(_ color: ColorSpaceType.ColorType) {
        context.setFillColor(color)
    }
    
    public func fillPath(using rule: CGPathFillRule = .winding) {
        context.fillPath(using: rule)
    }
    
    public func draw(_ image: BitmapImage, in rect: Rect, byTiling: Bool = false) {
        context.draw(image, in: rect, byTiling: byTiling)
    }
    
    public func draw(_ layer: BitmapLayer<ColorSpaceType>, at point: Point) {
        context.draw(layer, at: point)
    }
    
    public func clear(_ rect: Rect) {
        context.clear(rect)
    }
}

extension BitmapLayer {
    public func makeImage() -> BitmapImage? where ColorSpaceType == RGBAColorSpace {
        let context = BitmapContext<ColorSpaceType>(width: width, height: height)
        context.draw(self, at: .zero)
        return context.makeImage()
    }
    
    public func makeImage() -> BitmapImage? where ColorSpaceType == GrayColorSpace {
        let context = BitmapContext<ColorSpaceType>(width: width, height: height)
        context.draw(self, at: .zero)
        return context.makeImage()
    }
}

