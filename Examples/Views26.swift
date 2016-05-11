
import C4
import UIKit

class Views26: CanvasController {
    override func setup() {
        let c = Circle(center: canvas.center, radius: 100)
        c.shadow.opacity = 0.4
        c.shadow.radius = 3.0
        c.shadow.offset = Size(130, 130)

        let s = Star(center: Point(), pointCount: 40, innerRadius: 99, outerRadius: 105)
        c.shadow.path = s.path

        self.canvas.add(c)
    }
}
