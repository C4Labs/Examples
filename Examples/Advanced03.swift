//
//  Advanced03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced03: CanvasController {
    var shapes = [Shape]()
    override func setup() {
        for i in 0..<25 {
            let s = Rectangle(frame: Rect(0,0,self.canvas.height,16))
            s.opacity = Double(i + 10)/40
            s.lineWidth = 0.0

            s.anchorPoint = Point(0.5,Double(i))
            s.center = canvas.center
            shapes.append(s)
            canvas.add(s)
        }

        wait(1.0) {
            self.initiateAnimations()
        }
    }

    func rotate(shape: Shape, duration: Double) {
        let a = ViewAnimation(duration: duration) {
            shape.rotation += M_PI
        }
        a.addCompletionObserver {
            self.rotate(shape, duration: duration)
        }
        a.animate()
    }

    func initiateAnimations() {
        for i in 0..<shapes.count {
            let s = shapes[i]
            rotate(s, duration: Double(i) * 0.05 + 1.0)
        }
    }
}
