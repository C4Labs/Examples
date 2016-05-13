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

class Shapes17: CanvasController {

    override func setup() {
        //create the square and center it
        var f = Rect(0, 0, 250, 250)
        f.center = canvas.center

        let rect = Rectangle(frame: f)
        rect.lineWidth = 10.0
        rect.fillColor = clear
        rect.lineCap = .Round
        rect.lineDashPattern = [5, 20]
        canvas.add(rect)

        let star = Star(center: canvas.center, pointCount: 5, innerRadius: 50, outerRadius: 100)
        //style the text shape and set its dash pattern
        star.fillColor = clear
        star.lineWidth = 5.0
        star.lineDashPattern = [1, 10]

        //add the text shape to the canvas
        canvas.add(star)

        //animate it after a short wait
        let anim = ViewAnimation(duration:10.0) {    //duration = 3 minutes (60s * 3 = 180);
            rect.strokeColor = C4Pink
            star.strokeColor = C4Grey

            //set the final dash phase to the entire width of the pattern
            rect.lineDashPhase = self.canvas.width
            star.lineDashPhase = self.canvas.width
        }

        anim.autoreverses = true
        anim.repeats = true
        anim.animate()
    }
}
