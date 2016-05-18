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

    override func setup() {
        //we use an array of shapes and for() loops to set styles
        let colors = [black, darkGray, lightGray, gray, red, green, blue,
                      cyan, yellow, magenta, orange, purple, brown, white, clear]
        let labels = ["black", "darkGray", "lightGray", "gray", "red", "green", "blue",
                      "cyan", "yellow", "magenta", "orange", "purple", "brown", "white", "clear"]

        //create a frame for building each shape
        let frame = Rect(0, 0, self.canvas.width*0.96, self.canvas.height/18.0)

        //create a point that we can update to se the position of each object
        let dy = Vector(x: 0, y: canvas.height/16)
        var center = Point(canvas.center.x, dy.y)

        let f = Font(name: "Helvetica", size: 16.0)!
        //for every shape, update its linewidth, position and add it to the canvas
        for i in 0..<15 {
            let shape = Rectangle(frame: frame)
            shape.fillColor = colors[i]
            shape.center = center
            canvas.add(shape)

            let label = TextShape(text: labels[i], font: f)!

            //all labels will be white except white, clear, yellow, green and cyan
            switch labels[i] {
            case "yellow", "green", "cyan":
                shape.lineWidth = 0.0
                fallthrough
            case "white", "clear", "yellow", "green", "cyan":
                label.fillColor = C4Purple
            default:
                label.fillColor = white
                shape.lineWidth = 0.0
            }

            label.center = shape.bounds.center
            shape.add(label)

            center += dy
        }
    }
}
