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

class Views12: CanvasController {
    override func setup() {
        let dx = Vector(x: canvas.width/4, y: 0)

        let c1 = Circle(center: canvas.center - dx, radius: 66)
        let c2 = Circle(center: canvas.center, radius: 66)
        let c3 = Circle(center: canvas.center + dx, radius: 66)

        c1.shadow.opacity = 0.8
        c2.shadow.opacity = 0.8
        c3.shadow.opacity = 0.8

        c1.shadow.offset = Size(10, 10)
        c2.shadow.offset = Size(16, 20)
        c3.shadow.offset = Size(22, 28)

        c1.shadow.radius = 3.0
        c2.shadow.radius = 6.0
        c3.shadow.radius = 9.0

        c2.shadow.color = C4Pink
        c3.shadow.color = C4Blue

        canvas.add(c1)
        canvas.add(c2)
        canvas.add(c3)
    }
}
