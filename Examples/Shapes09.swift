//
//  Shapes09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
class Shapes09: CanvasController {
    override func setup() {
        //create a set of default points for all the lines
        let dx = Vector(x: 100, y: 0)
        let linePoints = [canvas.center - dx, canvas.center + dx]

        //create each line and style it, if necessary
        let line1 = Line(linePoints)
        let line2 = Line(linePoints)
        line2.strokeColor = C4Pink
        let line3 = Line(linePoints)
        line3.strokeColor = C4Blue

        //add all the lines to the canvas
        self.canvas.add(line1)
        self.canvas.add(line2)
        self.canvas.add(line3)

        //animate
        let dy = Vector(x: 0, y: 100)
        let a = ViewAnimation(duration:1.0) {
            line1.endPoints.0 += dy
            line2.endPoints.1 -= dy
        }

        a.repeats = true
        a.autoreverses = true
        a.delay = 1.0
        a.animate()
    }
}