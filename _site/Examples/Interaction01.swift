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

class Interaction01: CanvasController {

    override func setup() {

        let dy = Vector(x: 0, y: canvas.height/6)

        let top = Circle(center: canvas.center - dy, radius: 50)
        top.fillColor = C4Pink
        canvas.add(top)

        let bottom = Circle(center: canvas.center + dy, radius: 50)
        canvas.add(bottom)

        top.addTapGestureRecognizer { center, location, state in
            top.fillColor = C4Pink
            top.post("tapped")
        }

        bottom.addTapGestureRecognizer { center, location, state in
            bottom.fillColor = C4Blue
            bottom.post("tapped")
        }

        canvas.addTapGestureRecognizer { center, location, state in
            self.canvas.backgroundColor = C4Grey
            top.fillColor = C4Grey
            bottom.fillColor = C4Grey
        }

        on(event: "tapped", from: top) {
            self.canvas.backgroundColor = top.fillColor
        }

        on(event: "tapped", from: bottom) {
            self.canvas.backgroundColor = bottom.fillColor
        }
    }
}
