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

class Shapes03: CanvasController {
    override func setup() {
        var arcCenter = Point(canvas.width/3.0, canvas.center.y)
        var wedgeCenter = Point(2.0 * canvas.width/3.0, canvas.center.y)

        //create the counter-clockwise arc
        let counterClockwiseArc = Arc(center: arcCenter,
                                      radius: 100,
                                      start: 1.125 * M_PI,
                                      end: 1.875 * M_PI,
                                      clockwise: false)

        //create the clockwise arc, first shifting the center of the arc
        arcCenter.y -= 10
        let clockwiseArc = Arc(center: arcCenter,
                               radius: 100,
                               start: 1.125 * M_PI,
                               end: 1.875 * M_PI,
                               clockwise: true)

        //create the counter-clockwise wedge
        let counterClockwiseWedge = Wedge(center: wedgeCenter,
                                          radius: 100,
                                          start: M_PI_4 * 3,
                                          end: M_PI_4,
                                          clockwise: false)

        //create the clockwise wedge, first shifting the center of the wedge
        wedgeCenter.y -= 10
        let clockwiseWedge = Wedge(center: wedgeCenter,
                                   radius: 100,
                                   start: M_PI_4 * 3,
                                   end: M_PI_4,
                                   clockwise: true)

        //add the shapes to the canvas
        canvas.add(counterClockwiseArc)    //bottom
        canvas.add(clockwiseArc)           //top
        canvas.add(counterClockwiseWedge)  //bottom
        canvas.add(clockwiseWedge)         //top
    }
}
