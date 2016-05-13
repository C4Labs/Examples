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

class NewMath05: CanvasController {

    var shapes : [Shape] = [Shape]()
    var columns = 5
    var rows = 5

    override func setup() {
        let dx = canvas.width / Double(columns)
        let dy = canvas.height / Double(rows)

        let frame = Rect(0,0,50,16)
        for x in 0..<columns {
            for y in 0..<rows {
                let shape = Rectangle(frame: frame)//height must be greater than 16 or the cornerRadiusHeight * 2
                shape.anchorPoint = Point(0.0,0.5)
                shape.interactionEnabled = false

                let newX = dx * (Double(x) + 0.5)
                let newY = dy * (Double(y) + 0.5)
                shape.center = Point(newX, newY)

                shapes.append(shape)
                canvas.add(shape)
            }
        }

        canvas.addPanGestureRecognizer { (center, location, translation, velocity, state) -> () in
            for i in 0..<self.shapes.count {
                let shape = self.shapes[i]
                let angle = -1 * atan2(location.y-shape.center.y, location.x-shape.center.x)
                let transform = Transform.makeRotation(angle)
                shape.transform = transform
            }
        }
    }
}

