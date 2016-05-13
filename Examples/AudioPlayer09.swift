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

class AudioPlayer09: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    var avgL, avgR, peakL, peakR: Line!

    override func setup() {
        audioPlayer.play()
        audioPlayer.loops = true
        audioPlayer.meteringEnabled = true
        audioPlayer.play()

        createMeterLines()

        let t = Timer(interval: 1/30.0) {
            self.updateMeters()
        }
        t.start()
    }

    func createMeterLines() {
        let dx = Vector(x: canvas.width/4.0, y: 0)

        var points = (Point(0, canvas.height), Point())
        points.0 += dx/2.0
        points.1 += dx/2.0

        avgL = Line(points)
        avgL.lineCap = .Butt
        avgL.lineWidth = dx.x
        avgL.strokeColor = C4Pink
        points.0 += dx
        points.1 += dx

        avgR = Line(points)
        avgR.lineCap = .Butt
        avgR.lineWidth = dx.x
        avgR.strokeColor = C4Pink
        points.0 += dx
        points.1 += dx

        peakL = Line(points)
        peakL.lineCap = .Butt
        peakL.lineWidth = dx.x
        points.0 += dx
        points.1 += dx

        peakR = Line(points)
        peakR.lineCap = .Butt
        peakR.lineWidth = dx.x
        points.0 += dx
        points.1 += dx

        canvas.add(avgL)
        canvas.add(avgR)
        canvas.add(peakL)
        canvas.add(peakR)
    }

    func updateMeters() {
        ShapeLayer.disableActions = true
        audioPlayer.updateMeters()
        avgL.strokeEnd = pow(10, 0.05 * audioPlayer.averagePower(0))
        avgR.strokeEnd = pow(10, 0.05 * audioPlayer.averagePower(1))
        peakL.strokeEnd = pow(10, 0.05 * audioPlayer.peakPower(0))
        peakR.strokeEnd = pow(10, 0.05 * audioPlayer.peakPower(1))
        ShapeLayer.disableActions = false
    }
}
