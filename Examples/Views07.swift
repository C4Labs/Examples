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

class Views07: CanvasController {
    override func setup() {
        canvas.backgroundColor = white
        let points = [Point(), Point(canvas.center.x, 0), Point(0, canvas.center.y), canvas.center]
        for p in points {
            let r = Rectangle(frame: Rect(p, Size(canvas.width/2, canvas.height/2)))
            if p != points.first && p != points.last {
                r.fillColor = C4Pink
            }
            r.corner = Size()
            r.lineWidth = 25.0
            r.addTapGestureRecognizer { locations, center, state in
                self.temporarilyRemove(r)
            }
            canvas.add(r)
        }
    }

    func temporarilyRemove(shape: Shape) {
        shape.removeFromSuperview()
        wait(1.0) {
            self.canvas.add(shape)
        }
    }
}
