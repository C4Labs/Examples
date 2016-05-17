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

class Shapes19: CanvasController {
    override func setup() {
        var points = (Point(canvas.width/4, canvas.height/3),
                      Point(canvas.width*3/4, canvas.height/3))
        let dy = Vector(x: 0, y: 200)
        let bezier = Curve(begin: points.0,
                           control0: points.0 - dy,
                           control1: points.1 + dy,
                           end: points.1)
        canvas.add(bezier)

        points.0.y *= 2.0
        points.1.y *= 2.0
        let quad = QuadCurve(begin: points.0, control: canvas.center + dy, end: points.1)

        canvas.add(quad)
    }
}
