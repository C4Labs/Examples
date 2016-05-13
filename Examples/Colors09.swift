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

class Colors09: CanvasController {

    override func setup() {
        let dy = Vector(x: 0, y: canvas.height/5)

        var frame = Rect(Point(), Size(canvas.width * 0.9, canvas.height/6))
        frame.center = Point(canvas.center.x, dy.y)

        let blue = generateRect(frame, text: "C4Blue: \(C4Blue.red), \(C4Blue.green), \(C4Blue.blue), \(C4Blue.alpha)")
        canvas.add(blue)

        frame.center += dy
        let pink = generateRect(frame, text: "C4Pink: \(C4Pink.red), \(C4Pink.green), \(C4Pink.blue), \(C4Pink.alpha)")
        pink.fillColor = C4Pink

        frame.center += dy
        let purple = generateRect(frame, text: "C4Purple: \(C4Purple.red), \(C4Purple.green), \(C4Purple.blue), \(C4Purple.alpha)")
        purple.fillColor = C4Purple

        frame.center += dy
        let gray = generateRect(frame, text: "C4Grey: \(C4Grey.red), \(C4Grey.green), \(C4Grey.blue), \(C4Grey.alpha)")
        gray.fillColor = C4Grey
    }

    func generateRect(frame: Rect, text: String) -> Rectangle {
        let rect = Rectangle(frame: frame)
        canvas.add(rect)
        let label = TextShape(text: text, font: Font(name: "Helvetica", size: 20)!)!

        label.fillColor = text.hasPrefix("C4Grey") ? C4Purple : C4Grey

        label.center = rect.bounds.center
        rect.add(label)
        return rect
    }
}
