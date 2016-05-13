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

class Shapes13: CanvasController {
    var line1:Line!
    var line2:Line!
    
    override func setup() {
        createLines()
        line1.lineDashPattern = [5, 10]
        line2.lineDashPattern = [15, 30]
    }

    func createLines() {
        let dy = Vector(x: 0, y: canvas.height/3)

        //create end points for the first line
        var endPoints = (Point() + dy, Point(canvas.width, 0) + dy)

        //create the first line
        line1 = Line(endPoints)
        line1.lineWidth = 5

        endPoints.0 += dy
        endPoints.1 += dy

        //create the second line
        line2 = Line(endPoints)
        line2.lineWidth = 5

        //add the lines to the canvas
        canvas.add(line1)
        canvas.add(line2)
    }
}