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

class Colors02: CanvasController {

    override func setup() {
        let dy = Vector(x: 0, y: canvas.height/5)

        var frame = Rect(Point(), Size(canvas.width * 0.9, canvas.height/6))
        frame.center = Point(canvas.center.x, dy.y)

        let blue = generateRect(frame, text: "C4Blue")
        canvas.add(blue)

        frame.center += dy
        let pink = generateRect(frame, text: "C4Pink")
        pink.fillColor = C4Pink

        frame.center += dy
        let purple = generateRect(frame, text: "C4Purple")
        purple.fillColor = C4Purple

        frame.center += dy
        let gray = generateRect(frame, text: "C4Grey")
        gray.fillColor = C4Grey
    }

    func generateRect(frame: Rect, text: String) -> Rectangle {
        let rect = Rectangle(frame: frame)
        canvas.add(rect)
        let label = TextShape(text: text, font: Font(name: "Helvetica", size: 20)!)!

        label.fillColor = text == "C4Grey" ? C4Purple : C4Grey

        label.center = rect.bounds.center
        rect.add(label)
        return rect
    }
}

