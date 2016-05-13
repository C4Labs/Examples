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

class Shapes02: CanvasController {
    override func setup() {
        //create a 2 point array for the line
        let linePts = [Point(0, 0), Point(100, 100)]
        let line = Line(linePts)

        //create a 3 point array for the triangle
        let trianglePts = [Point(0, 100), Point(100, 100), Point(100, 0)]
        let triangle = Triangle(trianglePts)

        //create a 4 point array for the polygon
        let polygonPts = [Point(0, 0), Point(100, 0), Point(100, 100), Point(0, 100)]
        let polygon = Polygon(polygonPts)

        //create an array between 10 and 20 points for the random shape
        var points = [Point]()
        for _ in 0..<random(min: 10, max: 20) {
            points.append(Point(random(below:100), random(below:100)))
        }
        let randomPolygon = Polygon(points)

        //create a displacement vector
        let dx = Vector(x: canvas.width/5.0, y: 0)

        //position all the objects

        line.center = Point(0, canvas.center.y) + dx
        triangle.center = line.center + dx
        polygon.center = triangle.center + dx
        randomPolygon.center = polygon.center + dx

        //add shapes to canvas
        self.canvas.add(line)
        self.canvas.add(triangle)
        self.canvas.add(polygon)
        self.canvas.add(randomPolygon)
    }
}
