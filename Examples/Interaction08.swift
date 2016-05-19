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

class Interaction08: CanvasController {
    override func setup() {
        let r = Rectangle(frame: canvas.frame)
        r.corner = Size()
        canvas.add(r)

        let c = Circle(center: canvas.center, radius: canvas.height/3)
        c.strokeColor = white
        canvas.add(c)

        addSwipes(c)
        addSwipes(r)
    }

    func addSwipes(object: Shape) {
        addSwipe(object, direction: .Right)
        addSwipe(object, direction: .Down)
        addSwipe(object, direction: .Left)
        addSwipe(object, direction: .Up)
    }

    func addSwipe(object: Shape, direction dir: UISwipeGestureRecognizerDirection) {
        let swipe = object.addSwipeGestureRecognizer { (locations, center, state, direction) in
            switch direction {
            case UISwipeGestureRecognizerDirection.Right:
                object.fillColor = C4Blue
            case UISwipeGestureRecognizerDirection.Down:
                object.fillColor = C4Pink
            case UISwipeGestureRecognizerDirection.Left:
                object.fillColor = C4Purple
            default:
                object.fillColor = C4Grey
            }
        }
        swipe.direction = dir
    }
}
