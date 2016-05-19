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

class Advanced02: CanvasController {
    var shapes = [Shape]()

    override func setup() {
        //create 25 shapes (enough to fill the screen)
        for i in 0..<25 {
            let s = Rectangle(frame: Rect(0, 0, self.canvas.height, 16))
            s.opacity = Double(i + 10)/40
            s.lineWidth = 0.0

            //offset the anchorPoint of each shape by the current index
            s.anchorPoint = Point(0.5, Double(i))
            s.center = canvas.center
            shapes.append(s)
            canvas.add(s)
        }

        //wait just a bit before starting things up
        wait(1.0) {
            self.initiateAnimations()
        }
    }

    //rotate a shape for a given duration
    func rotate(shape: Shape, duration: Double) {
        //create the animation
        let a = ViewAnimation(duration: duration) {
            //rotate it halfway around a circle
            shape.rotation += M_PI
        }
        //when complete, initiate another rotation
        a.addCompletionObserver {
            self.rotate(shape, duration: duration)
        }
        a.animate()
    }

    func initiateAnimations() {
        //offset the duration of each shape by the current index
        //shapes further away will take longer to rotate
        for i in 0..<shapes.count {
            let s = shapes[i]
            rotate(s, duration: Double(i) * 0.05 + 1.0)
        }
    }
}
