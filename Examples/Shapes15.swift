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

class Shapes15: CanvasController {
    override func setup() {
        //create the line and center it
        let points = (Point(0, canvas.center.y), Point(canvas.width, canvas.center.y))
        let line = Line(points)
        line.lineWidth = 100.0
        canvas.add(line)

        //create a dash pattern
        var dashPattern = [Double]()
        for i in Int(line.lineWidth)..<Int(canvas.width + line.lineWidth) {
            dashPattern.append(Double(i))
            dashPattern.append(dashPattern.last!)
        }
        line.lineDashPattern = dashPattern

        let a = ViewAnimation(duration:30.0) {    //duration = 5 minutes (60s * 5 = 300);
            line.strokeColor = C4Pink
            //set the final dash phase to the entire width of the pattern
            line.lineDashPhase = dashPattern.reduce(0, combine: +)
        }

        a.autoreverses = true
        a.repeats = true
        a.animate()
    }
}
