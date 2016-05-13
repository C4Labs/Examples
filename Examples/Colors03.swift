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

class Colors03: CanvasController {
    //we use an array of shapes and for() loops to set styles
    var shapes = [Shape]()
    var colors = [black, darkGray, lightGray, gray, red, green, blue, cyan, yellow, magenta, orange, purple, brown, white, clear]
    var labels = ["black", "darkGray", "lightGray", "gray", "red", "green", "blue", "cyan", "yellow", "magenta", "orange", "purple", "brown", "white", "clear"]

    override func setup() {
        //create a frame for building each shape
        let frame = Rect(0, 0, self.canvas.width*0.96, self.canvas.height/18.0)

        //create an array of 15 shapes
        for _ in 0..<15 {
            shapes.append(Rectangle(frame: frame))
        }

        //create a point that we can update to se the position of each object
        let dy = Vector(x: 0, y: canvas.height/16)
        var center = Point(canvas.center.x, dy.y)

        let f = Font(name: "Helvetica", size: 16.0)!
        //for every shape, update its linewidth, position and add it to the canvas
        for i in 0..<shapes.count {
            let shape = shapes[i]
            shapes[i].fillColor = colors[i]
            shape.lineWidth = 0.0
            shape.center = center
            center += dy
            self.canvas.add(shape)

            let ts = TextShape(text: labels[i], font: f)!
            //all labels will be white except the last two
            if(i < 13) {
                ts.fillColor = white
            } else {
                ts.fillColor = C4Purple
                shape.lineWidth = 1.0
            }
            ts.center = shape.bounds.center
            shape.add(ts)
        }
    }
}

