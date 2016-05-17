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

class Fonts01: CanvasController {
    override func setup() {
        //create an initial font and a label
        let label = TextShape(text: "Default Font")!
        label.center = Point(canvas.center.x, canvas.height/3)

        //use the initial font to create a new font with a bigger size
        let f = Font(name: "Helvetica", size: 30.0)!
        let smallLabel = TextShape(text: "Small Font", font: f)!
        smallLabel.center = Point(canvas.center.x, canvas.height*2/3)

        //add the labels to the canvas
        self.canvas.add(label)
        self.canvas.add(smallLabel)
    }
}
