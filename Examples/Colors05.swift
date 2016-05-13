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

class Colors05: CanvasController {

    var red, green, blue: Shape!

    override func setup() {
        setupShapes()
        setupLabels()

        red.fillColor  = Color(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        green.fillColor  = Color(hue: 0.33, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        blue.fillColor  = Color(hue: 0.66, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

    func setupShapes() {
        let frame = Rect(0, 0, canvas.width*0.9, canvas.height/5)

        red =  Rectangle(frame: frame)
        green = Rectangle(frame: frame)
        blue = Rectangle(frame: frame)

        red.lineWidth = 0.0
        green.lineWidth = 0.0
        blue.lineWidth = 0.0

        let dy = Vector(x: 0, y: canvas.height/4)
        red.center  = canvas.center - dy
        green.center = canvas.center
        blue.center = canvas.center + dy

        canvas.add(red)
        canvas.add(green)
        canvas.add(blue)
    }

    func setupLabels() {
        let f = Font(name: "Helvetica" , size: 30.0)!
        var l:TextShape!

        l = TextShape(text: "{HSBA} : {0.0, 1.0, 1.0, 1.0}", font: f)
        l.fillColor = white
        l.center = red.center
        self.canvas.add(l)

        l = TextShape(text: "{HSBA} : {0.33, 1.0, 0, 1.0}", font: f)
        l.fillColor = white
        l.center = green.center
        self.canvas.add(l)

        l = TextShape(text: "{HSBA} : {0.66, 1.0, 1.0, 1.0}", font: f)
        l.fillColor = white
        l.center = blue.center
        self.canvas.add(l)
    }
}