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

class Interaction03: CanvasController {

    override func setup() {
        let c = Circle(center: canvas.center, radius: canvas.height/3)
        c.lineWidth = 40.0
        c.addLongPressGestureRecognizer { locations, center, state in
            switch state {
            case .Began, .Changed:
                self.randomColor(c)
            default:
                c.fillColor = C4Blue
                c.strokeColor = C4Purple
            }
        }
        canvas.add(c)
    }

    func randomColor(shape: Shape) {
        shape.fillColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
        shape.strokeColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
    }
}
