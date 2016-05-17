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

class Interaction04: CanvasController {

    override func setup() {
        let dx = Vector(x: 100, y: 0)
        let dy = Vector(x: 0, y: 100)

        let c = canvas.center

        let defaultPoints: [Point] = [
            ((c - dx) - dy),
            c - dy,
            (c + dx) - dy,
            c + dx,
            (c + dx) + dy,
            c + dy,
            (c - dx) + dy,
            c - dx]

        var polyPoints = defaultPoints

        let poly = Polygon(polyPoints)
        poly.interactionEnabled = false
        poly.close()
        poly.lineWidth = 40.0
        canvas.add(poly)

        let pan = canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            polyPoints = defaultPoints
            for i in 0..<locations.count {
                polyPoints[i * 2] = locations[i]
            }
            poly.points = polyPoints
            poly.close()
        }

        pan.maximumNumberOfTouches = 4
    }
}
