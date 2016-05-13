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

class Images07: CanvasController {
    override func setup() {
        //we create an array for our color data
        var rawData = [Pixel]()

        let colors = [C4Pink, C4Blue, C4Purple, C4Grey]
        //for every row
        for _ in 0..<Int(canvas.height) {
            //color each pixel in that row
            for _ in 0..<Int(canvas.width) {
                //create a pixel from a random color in our set
                rawData.append(Pixel(colors[random(below: 4)]))
            }
        }

        let img = Image(pixels: rawData, size: canvas.size)
        img.center = canvas.center
        canvas.add(img)
    }
}
