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

class AudioPlayer06: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    var bar: Rectangle!
    var barFill: Rectangle!

    override func setup() {
        audioPlayer.loops = true
        audioPlayer.play()
        createIndicators()

        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            self.audioPlayer.volume = center.x / self.canvas.width
            self.updateBar(center)
        }
    }

    func updateBar(point: Point) {
        barFill.origin = Point(point.x-canvas.width, 0)
    }

    func createIndicators() {
        let trianglePoints = [Point(0, canvas.height), Point(canvas.width, 0), Point(canvas.width, canvas.height)]
        let barMask = Triangle(trianglePoints)

        bar = Rectangle(frame: canvas.frame)
        bar.interactionEnabled = false
        bar.lineWidth = 0
        bar.fillColor = clear
        bar.mask = barMask
        canvas.add(bar)

        barFill = Rectangle(frame: bar.bounds)
        barFill.corner = Size()
        barFill.lineWidth = 5.0
        barFill.strokeColor = barFill.fillColor
        bar.add(barFill)

        var points = (Point(), Point(0, canvas.height))
        let dx = Vector(x: 8, y: 0)
        repeat {
            let line = Line(points)
            line.strokeColor = C4Pink
            bar.add(line)
            points.0 += dx
            points.1 += dx
        } while points.0.x < canvas.width
    }
}
