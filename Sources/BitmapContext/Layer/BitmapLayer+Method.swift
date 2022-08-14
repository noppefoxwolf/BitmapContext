import CoreGraphics

extension BitmapLayer {
    public func saveGState() {
        context.saveGState()
    }
    
    public func restoreGState() {
        context.restoreGState()
    }
    
    public func clip(to: Rect) {
        context.clip(to: to)
    }
    
    public func resetClip() {
        context.resetClip()
    }
    
    public func setBlendMode(_ blendMode: CGBlendMode) {
        context.setBlendMode(blendMode)
    }
}
