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
    override func setup() {
        let dy = Vector(x: 0, y: 2.0)

        //create and array of points to use for lines
        var points = (Point()-dy,Point(self.canvas.width,0.0)-dy)

        //figure out the total number of lines to draw
        let totalLineCount = self.canvas.height / 2.0 //default line width of 1.0

        //figure out displacement of strokeStart and strokeEnd
        let strokeDisplacement = 0.5 / totalLineCount

        for i in 0..<Int(totalLineCount) {
            points.0 += dy
            points.1 += dy

            //create a new line
            let newLine = Line(points)

            //determine the current displacement of the ends of the line
            let ds = strokeDisplacement*Double(i)
            newLine.strokeStart = 0.5 - ds
            newLine.strokeEnd = 0.5 + ds

            self.canvas.add(newLine)
        }
    }
}