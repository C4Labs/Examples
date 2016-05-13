//
//  Advanced05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-15.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit


class Advanced05: CanvasController {
    override func setup() {
        var bottom = [Circle]()
        var middle = [Circle]()
        var top = [Circle]()

        for _ in 1...30 {
            let r = Double(random(min: 8, max: 16))

            bottom.append(Circle(center: canvas.center, radius: r * 2))
            middle.append(Circle(center: canvas.center, radius: r * 1.5))
            top.append(Circle(center: canvas.center, radius: r))

            for c in bottom {
                c.lineWidth = 0
                c.fillColor = C4Pink
                canvas.add(c)
            }

            for c in middle {
                c.lineWidth = 0
                canvas.add(c)
            }

            for c in top {
                c.lineWidth = 0
                c.fillColor = C4Purple
                canvas.add(c)
            }
        }

        wait(1.0) {
            for i in 0..<bottom.count {
                self.move((bottom[i], middle[i], top[i]))
            }
        }
    }

    func move(shapes: (Circle, Circle, Circle)) {
        let d = random01()*3 + 1
        let r = (180 - shapes.0.width/2) * random01()
        let 𝝧 = random01() * 2 * M_PI
        let point = Point(r * cos(𝝧), r * sin(𝝧)) + Vector(canvas.center)

        let b = ViewAnimation(duration: d) {
            shapes.0.center = point
        }
        b.delay = 0.05
        b.addCompletionObserver {
            wait(random01()) {
                self.move(shapes)
            }
        }
        let m = ViewAnimation(duration: d) {
            shapes.1.center = point
        }
        m.delay = 0.025
        let t = ViewAnimation(duration: d) {
            shapes.2.center = point
        }

        let group = ViewAnimationGroup(animations: [b,m,t])
        group.animate()
    }
}





