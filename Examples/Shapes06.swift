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
import UIKit

class Shapes06: CanvasController {
    override func setup() {
        //create a variable rect
        var f = Rect(0, 0, 200, 200)

        //position the frame, create the default shape
        f.center = Point(canvas.width/3, canvas.center.y)
        let shape = Ellipse(frame: f)

        //position the frame, create the custom shape
        f.center = Point(canvas.width*2/3, canvas.center.y)
        let custom = Ellipse(frame: f)

        //you can cast from a UIColor to a C4 Color
        //set the fill and stroke colors for the custom shape
        custom.fillColor = Color(UIColor.greenColor())
        custom.strokeColor = Color(UIColor.magentaColor())

        //add the shapes to the canvas
        self.canvas.add(shape)
        self.canvas.add(custom)
    }
}
