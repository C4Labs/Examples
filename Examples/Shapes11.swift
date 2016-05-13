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

import UIKit
import C4

class Shapes11: CanvasController {
    var poly1: Polygon!
    var poly2: Polygon!
    var poly3: Polygon!

    override func setup() {
        self.createAndStylePolygons()
        self.createLabels()

        //set the lineJoin property for each shape
        poly1.lineJoin = .Miter //This is the default value
        poly2.lineJoin = .Round
        poly3.lineJoin = .Bevel
    }

    func createAndStylePolygons() {
        //the base width for the polygons
        let base = 125.0
        let height = sqrt(3)/4.0 * base // half the height of an equilateral
        let polyPoints = [Point(), Point(base/2, -height), Point(base, 0)]

        let dx = Vector(x: canvas.width/4, y: 0)
        //create poly1 and style it
        poly1 = Polygon(polyPoints)
        poly1.lineWidth = 20.0
        poly1.center = canvas.center - dx

        //create poly2 and style it
        poly2 = Polygon(polyPoints)
        poly2.strokeColor = C4Blue
        poly2.lineWidth = 20.0
        poly2.center = canvas.center
        poly2.lineJoin = .Round

        //create poly3 and style it
        poly3 = Polygon(polyPoints)
        poly3.strokeColor = C4Pink
        poly3.lineWidth = 20.0
        poly3.center = canvas.center + dx

        //add all the polygons to the canvas
        self.canvas.add(poly1)
        self.canvas.add(poly2)
        self.canvas.add(poly3)
    }

    func createLabels() {
        let f = Font(name: "Helvetica", size:30.0)!

        //create the JOINMITER label, center it to the base of poly1
        var l = TextShape(text: ".Miter", font: f)!
        var center = poly1.center
        center.y += poly1.height
        l.center = center
        self.canvas.add(l)

        //create the JOINROUND label, center it to the base of poly2
        l = TextShape(text: ".Round", font: f)!
        center = poly2.center
        center.y += poly2.height
        l.center = center
        self.canvas.add(l)

        //create the JOINBEVEL label, center it to the base of poly3
        l = TextShape(text: ".Bevel", font: f)!
        center = poly3.center
        center.y += poly3.height
        l.center = center
        self.canvas.add(l)
    }
}
