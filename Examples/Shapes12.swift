//
//  Shapes12.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes12: CanvasController {
    override func setup() {
        //first shape will animate the start to the end
        let dx = Vector(x: canvas.width/4.0, y: 0)
        let start = Circle(center: canvas.center - dx, radius: 50)
        start.lineWidth = 30.0
        start.fillColor = clear
        canvas.add(start)

        //second shape will animate the end to the start
        let end = Circle(center: canvas.center, radius: 50)
        end.strokeColor = C4Blue
        end.lineWidth = 30.0
        end.fillColor = clear
        canvas.add(end)

        //third shape will animate the start and end to a mid-point
        let both = Circle(center: canvas.center + dx, radius: 50)
        both.lineWidth = 30.0
        both.strokeColor = C4Pink
        both.fillColor = clear
        self.canvas.add(both)
       
        let a = ViewAnimation(duration:2.0) {
            start.strokeStart = 1
        }
        a.repeats = true
        a.autoreverses = true

        let b = ViewAnimation(duration:2.0) {
            end.strokeEnd = 0
        }
        b.repeats = true
        b.autoreverses = true

        let c = ViewAnimation(duration:2.0) {
            both.strokeStart = 0.5
            both.strokeEnd = 0.5
        }
        c.repeats = true
        c.autoreverses = true

        let grp = ViewAnimationGroup(animations: [a, b, c])
        grp.animate()
    }
}