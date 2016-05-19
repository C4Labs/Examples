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
    override func setup() {
        //create 3 arrays of shapes
        var bottom = [Circle]()
        var middle = [Circle]()
        var top = [Circle]()

        //generate 40 "cells"
        for _ in 1...40 {
            //calculate the smallest radius of the current cell
            let r = Double(random(min: 8, max: 16))

            //create 3 layers for the cell
            bottom.append(Circle(center: canvas.center, radius: r * 2))
            middle.append(Circle(center: canvas.center, radius: r * 1.5))
            top.append(Circle(center: canvas.center, radius: r))
        }

        //style the bottom layer of each cell
        for c in bottom {
            c.lineWidth = 0
            c.fillColor = C4Pink
            canvas.add(c)
        }

        //style the middle layers of each cell
        for c in middle {
            c.lineWidth = 0
            canvas.add(c)
        }

        //style the top layer of each cell
        for c in top {
            c.lineWidth = 0
            c.fillColor = C4Purple
            canvas.add(c)
        }

        //wait a little bit to get going...
        wait(1.0) {
            for i in 0..<bottom.count {
                self.move((bottom[i], middle[i], top[i]))
            }
        }
    }

    //a cell is made up of 3 shapes, so move the all!
    func move(shapes: (Circle, Circle, Circle)) {
        //create a random duration, between 1 and 4 seconds
        let d = random01()*3 + 1
        //create a random radius for the length of movement
        let r = (180 - shapes.0.width/2) * random01()
        //create a random angle
        let 𝝧 = random01() * 2 * M_PI
        //generate a target point using polar coordinates, centered on the canvas
        let point = Point(r * cos(𝝧), r * sin(𝝧)) + Vector(canvas.center)

        //create animation for the bottom part of the cell
        let b = ViewAnimation(duration: d) {
            shapes.0.center = point
        }
        //offset this animation by 1/20th of a second
        b.delay = 0.05
        //when the bottom has finished moving...
        b.addCompletionObserver {
            //wait for a random amount of time, up to 1 second
            wait(random01()) {
                //move everything again
                self.move(shapes)
            }
        }
        //create animation for the middle part of the cell
        let m = ViewAnimation(duration: d) {
            shapes.1.center = point
        }
        //offset this animation by 1/40th of a second
        m.delay = 0.025

        //create animation for the top part of the cell
        let t = ViewAnimation(duration: d) {
            shapes.2.center = point
        }

        //trigger all the animations
        let group = ViewAnimationGroup(animations: [b, m, t])
        group.animate()
    }
}
