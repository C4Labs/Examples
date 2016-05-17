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

class Advanced03: CanvasController {
    var shapes = [Shape]()
    override func setup() {
        for i in 0..<25 {
            let s = Rectangle(frame: Rect(0, 0, self.canvas.height, 16))
            s.opacity = Double(i + 10)/40
            s.lineWidth = 0.0

            s.anchorPoint = Point(0.5, Double(i))
            s.center = canvas.center
            shapes.append(s)
            canvas.add(s)
        }

        wait(1.0) {
            self.initiateAnimations()
        }
    }

    func rotate(shape: Shape, duration: Double) {
        let a = ViewAnimation(duration: duration) {
            shape.rotation += M_PI
        }
        a.addCompletionObserver {
            self.rotate(shape, duration: duration)
        }
        a.animate()
    }

    func initiateAnimations() {
        for i in 0..<shapes.count {
            let s = shapes[i]
            rotate(s, duration: Double(i) * 0.05 + 1.0)
        }
    }
}
