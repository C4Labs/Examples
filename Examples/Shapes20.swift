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

class Shapes20: CanvasController {
    var a, b, c: UIPanGestureRecognizer!

    override func setup() {
        var points = (Point(canvas.width/4, canvas.height/3), Point(canvas.width*3/4, canvas.height/3))
        let bezier = Curve(begin: points.0, control0: points.0, control1: points.1, end: points.1)
        canvas.add(bezier)

        let cA = Circle(center: points.0, radius: 22)
        let cB = Circle(center: points.1, radius: 22)
        cB.fillColor = C4Pink

        points.0.y *= 2.0
        points.1.y *= 2.0
        let quad = QuadCurve(begin: points.0, control: lerp(points.0, points.1, at: 0.5), end: points.1)

        canvas.add(quad)
        let cC = Circle(center: quad.controlPoint, radius: 22)
        cC.fillColor = C4Purple

        canvas.add(cA)
        canvas.add(cB)
        canvas.add(cC)

        a = cA.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cA.center += translation
            bezier.controlPoints.0 = cA.center
            self.a.setTranslation(CGPoint(), inView: self.canvas.view)
        }

        b = cB.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cB.center += translation
            bezier.controlPoints.1 = cB.center
            self.b.setTranslation(CGPoint(), inView: self.canvas.view)
        }

        c = cC.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cC.center += translation
            quad.controlPoint = cC.center
            self.c.setTranslation(CGPoint(), inView: self.canvas.view)
        }
    }
}
