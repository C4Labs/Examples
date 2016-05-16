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
class Shapes16: CanvasController {
    var poly1, poly2: Polygon!

    override func setup() {
        createPolygons()
        createLabels()

        //define the fill rules for each polygon
        poly1.fillRule = .NonZero //Default value
        poly2.fillRule = .EvenOdd
    }

    func createPolygons() {
        let points = [Point(),
                      Point(150, -150),
                      Point(200, -100),
                      Point(100, 0),
                      Point(0, -100),
                      Point(50, -150),
                      Point(200, 0)]

        //create poly1 and style it
        poly1 = Polygon(points)
        poly1.fillColor = C4Blue
        poly1.center = Point(canvas.width/3, canvas.center.y)

        //create poly2 and style it
        poly2 = Polygon(points)
        poly2.fillColor = C4Blue
        poly2.center = Point(canvas.width*2/3, canvas.center.y)

        //add all the polygons to the canvas
        canvas.add(poly1)
        canvas.add(poly2)
    }

    func createLabels() {
        let f = Font(name: "Helvetica", size: 30)!

        //create the NonZero label, center it to the base of poly1
        let lableNormal =  TextShape(text: ".NonZero", font: f)!
        lableNormal.center = poly1.center
        lableNormal.center.y += poly1.height/2 + lableNormal.height
        canvas.add(lableNormal)

        //create the EvenOdd label, center it to the base of poly2
        let labelEvenOdd =  TextShape(text: ".EvenOdd", font: f)!
        labelEvenOdd.center = poly2.center
        labelEvenOdd.center.y += poly2.height/2 + labelEvenOdd.height
        canvas.add(labelEvenOdd)
    }
}
