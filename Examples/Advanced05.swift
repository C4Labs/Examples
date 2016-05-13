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


class Advanced05: CanvasController {
    override func setup() {
        var bottom = [Circle]()
        var middle = [Circle]()
        var top = [Circle]()

        for _ in 1...30 {
            let r = Double(random(min: 8, max: 16))

            bottom.append(Circle(center: canvas.center, radius: r * 2))
            middle.append(Circle(center: canvas.center, radius: r * 1.5))
            top.append(Circle(center: canvas.center, radius: r))

            for c in bottom {
                c.lineWidth = 0
                c.fillColor = C4Pink
                canvas.add(c)
            }

            for c in middle {
                c.lineWidth = 0
                canvas.add(c)
            }

            for c in top {
                c.lineWidth = 0
                c.fillColor = C4Purple
                canvas.add(c)
            }
        }

        wait(1.0) {
            for i in 0..<bottom.count {
                self.move((bottom[i], middle[i], top[i]))
            }
        }
    }

    func move(shapes: (Circle, Circle, Circle)) {
        let d = random01()*3 + 1
        let r = (180 - shapes.0.width/2) * random01()
        let 𝝧 = random01() * 2 * M_PI
        let point = Point(r * cos(𝝧), r * sin(𝝧)) + Vector(canvas.center)

        let b = ViewAnimation(duration: d) {
            shapes.0.center = point
        }
        b.delay = 0.05
        b.addCompletionObserver {
            wait(random01()) {
                self.move(shapes)
            }
        }
        let m = ViewAnimation(duration: d) {
            shapes.1.center = point
        }
        m.delay = 0.025
        let t = ViewAnimation(duration: d) {
            shapes.2.center = point
        }

        let group = ViewAnimationGroup(animations: [b,m,t])
        group.animate()
    }
}





