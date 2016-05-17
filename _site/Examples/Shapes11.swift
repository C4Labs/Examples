// Copyright © 2016 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import UIKit
import C4

class Shapes11: CanvasController {
    override func setup() {
        //first shape will animate the start to the end
        let dx = Vector(x: canvas.width/4.0, y: 0)
        let start = createShape(canvas.center - dx, color: C4Blue)

        //second shape will animate the end to the start
        let end = createShape(canvas.center, color: C4Purple)

        //third shape will animate the start and end to a mid-point
        let both = createShape(canvas.center + dx, color: C4Pink)

        let a = ViewAnimation(duration:2.0) {
            start.strokeStart = 1
        }
        a.repeats = true
        a.autoreverses = true

        let b = ViewAnimation(duration:2.0) {
            end.strokeEnd = 0
        }
        b.repeats = true
        b.autoreverses = true

        let c = ViewAnimation(duration:2.0) {
            both.strokeStart = 0.5
            both.strokeEnd = 0.5
        }
        c.repeats = true
        c.autoreverses = true

        let grp = ViewAnimationGroup(animations: [a, b, c])
        grp.animate()
    }

    func createShape(center: Point, color: Color) -> Shape {
        let shape = Circle(center: center, radius: 50)
        shape.lineWidth = 30.0
        shape.strokeColor = color
        shape.fillColor = clear
        canvas.add(shape)
        return shape
    }
}
