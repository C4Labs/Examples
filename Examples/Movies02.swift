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

class Movies02: CanvasController {
    override func setup() {
        let normal = Movie("halo.mp4")!
        normal.height = 240
        normal.center = canvas.center

        let tall = Movie("halo.mp4")!
        tall.frame = normal.frame
        tall.constrainsProportions = false
        tall.height = canvas.height
        tall.center = canvas.center

        let wide = Movie("halo.mp4")!
        wide.frame = normal.frame
        wide.constrainsProportions = false
        wide.width = canvas.width
        wide.center = canvas.center

        let full = Movie("halo.mp4")!
        full.frame = canvas.frame

        let movies = [normal, tall, wide, full]
        for mov in movies {
            mov.opacity = 0.66
            mov.border.color = white
            mov.border.width = 0.5
            mov.muted = true
            mov.loops = true
            mov.play()
        }
        normal.muted = false

        canvas.add(full)
        canvas.add(tall)
        canvas.add(wide)
        canvas.add(normal)
    }
}
