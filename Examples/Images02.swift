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

class Images02 : CanvasController {
    override func setup() {
        let normal = Image("rockies")!
        normal.center = canvas.center

        let tall = Image(c4image: normal)
        tall.height = canvas.height
        tall.center = canvas.center

        let wide = Image(c4image: normal)
        wide.width = canvas.width
        wide.center = canvas.center

        let full = Image(c4image: normal)
        full.frame = canvas.frame
        self.canvas.add(full)

        let images = [normal, tall, wide, full]
        for img in images {
            img.opacity = 0.66
            img.border.color = white
            img.border.width = 0.5
        }

        canvas.add(full)
        canvas.add(tall)
        canvas.add(wide)
        canvas.add(normal)
    }
}