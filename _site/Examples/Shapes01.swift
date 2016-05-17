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

class Shapes01: CanvasController {
    override func setup() {
        let rectangle = Rectangle(frame: Rect(0, 0, 100, 200)) //Create a rectangle
        let square = Rectangle(frame: Rect(0, 0, 100, 100)) //Create a square (same w & h)
        let ellipse = Ellipse(frame: rectangle.frame) // same dimensions as rectangle //Create an ellipse
        let circle = Circle(center: Point(0, 0), radius: 50) // same dimensions as square //Create a circle (same w & h)

        //Figure out the horizontal whitespace (i.e. the space between shapes and the edges of the canvas)
        let whiteSpace = (canvas.width - 4 * rectangle.width)/5 // divide by 5 because there are 5 gaps

        //Create a displacement vector
        let dx = Vector(x: whiteSpace + rectangle.width, y: 0)

        //center all the shapes to the canvas
        var center = Point(whiteSpace + rectangle.width/2, canvas.center.y)

        //set the x position for the rectangle
        rectangle.center = center

        //set the x position for the square
        center += dx
        square.center = center

        //set the x position for the circle
        center += dx
        circle.center = center

        //set the x position for the ellipse
        center += dx
        ellipse.center = center

        //add all the objects to the canvas
        self.canvas.add(rectangle)
        self.canvas.add(square)
        self.canvas.add(circle)
        self.canvas.add(ellipse)
    }
}
