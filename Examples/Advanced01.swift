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

class Advanced01: CanvasController {
    var pts = (Point(), Point())
    var canvasShapeCount = 0
    
    override func setup() {
        pts = (canvas.center, canvas.center)
        createArc()
    }
    
    func createArc() {
        pts.0 = pts.1
        pts.1 = Point(random01()*self.canvas.width, self.canvas.center.y);

        let up = canvasShapeCount % 2 == 0 ? true : false
        let arc = self.arcBetween(pts, up: up)

        canvas.add(arc)
        canvasShapeCount += 1

        let a = ViewAnimation(duration:1.0) {
            if arc.strokeStart == 1.0 {
                arc.strokeStart = 0.0
            } else {
                arc.strokeEnd = 1.0
            }
        }

        a.addCompletionObserver { 
            self.createArc()
        }
        a.animate()
   }
    
    func arcBetween(points: (Point, Point) ,up:Bool) -> Arc {
        ShapeLayer.disableActions = true

        let s = Arc(center: lerp(points.0, points.1, at: 0.5),
                    radius: distance(points.0, rhs: points.1)/2,
                    start: up ? M_PI : 0,
                    end: up ? 2 * M_PI : M_PI,
                    clockwise: true)
        s.fillColor = clear

        if(points.1.x > points.0.x) {
            if(up) {
                s.strokeEnd = 0.0
            } else {
                s.strokeStart = 1.0
            }
        } else {
            if(up) {
                s.strokeStart = 1.0
            } else {
                s.strokeEnd = 0.0
            }
        }

        if(up) {
            s.strokeColor = C4Pink
        }
        ShapeLayer.disableActions = false

        return s
    }
}
