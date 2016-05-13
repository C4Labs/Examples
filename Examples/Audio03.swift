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

class Audio03: CanvasController {

    let audioPlayer = AudioPlayer("C4Loop.aif")!

    override func setup() {
        let font = Font(name: "Helvetica", size: 30.0)!
        //create text shape to display duration of mp3

        let dur = TextShape(text: "Duration: \(audioPlayer.duration)s", font: font)!
        dur.center = canvas.center - Vector(x: 0, y: dur.height)
        canvas.add(dur)

        let cur = TextShape(text: "Current: \(audioPlayer.currentTime)s", font: font)!
        cur.center = canvas.center + Vector(x: 0, y: cur.height)
        canvas.add(cur)

        let t = Timer(interval: 1.0/60.0) {
            ShapeLayer.disableActions = true
            let c = cur.center
            cur.text = String(format: "Current: %.2fs", self.audioPlayer.currentTime)
            cur.center = c
            ShapeLayer.disableActions = false
        }
        t.start()

        audioPlayer.loops = true
        audioPlayer.play()
    }
}
