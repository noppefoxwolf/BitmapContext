import CoreGraphics

extension BitmapContext {
    public func saveGState() {
        context.saveGState()
    }
    
    public func restoreGState() {
        context.restoreGState()
    }
    
    public func clip(using rule: CGPathFillRule = .winding) {
        context.clip(using: rule)
    }
    
    public func clip(to: Rect) {
        context.clip(to: to.cgRect)
    }
    
    public func resetClip() {
        context.resetClip()
    }
    
    public func setBlendMode(_ blendMode: CGBlendMode) {
        context.setBlendMode(blendMode)
    }
    
    public func makeImage() -> BitmapImage? {
        context.makeImage().map(BitmapImage.init(image:))
    }
}
