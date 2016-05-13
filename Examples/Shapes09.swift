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

import C4
class Shapes09: CanvasController {
    override func setup() {
        //create a set of default points for all the lines
        let dx = Vector(x: 100, y: 0)
        let linePoints = [canvas.center - dx, canvas.center + dx]

        //create each line and style it, if necessary
        let line1 = Line(linePoints)
        let line2 = Line(linePoints)
        line2.strokeColor = C4Pink
        let line3 = Line(linePoints)
        line3.strokeColor = C4Blue

        //add all the lines to the canvas
        self.canvas.add(line1)
        self.canvas.add(line2)
        self.canvas.add(line3)

        //animate
        let dy = Vector(x: 0, y: 100)
        let a = ViewAnimation(duration:1.0) {
            line1.endPoints.0 += dy
            line2.endPoints.1 -= dy
        }

        a.repeats = true
        a.autoreverses = true
        a.delay = 1.0
        a.animate()
    }
}