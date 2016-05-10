//
//  Shapes04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes04 : CanvasController {
    override func setup() {
        var arcCenter = Point(canvas.width/3.0, canvas.center.y)
        var wedgeCenter = Point(2.0 * canvas.width/3.0, canvas.center.y)

        //create the counter-clockwise arc
        let counterClockwiseArc = Arc(center: arcCenter,radius: 100, start: 1.125 * M_PI, end: 1.875 * M_PI, clockwise: false)

        //create the clockwise arc, first shifting the center of the arc
        arcCenter.y -= 10
        let clockwiseArc = Arc(center: arcCenter,radius: 100, start: 1.125 * M_PI, end: 1.875 * M_PI, clockwise: true)

        //create the counter-clockwise wedge
        let counterClockwiseWedge = Wedge(center: wedgeCenter, radius: 100, start: M_PI_4 * 3, end: M_PI_4, clockwise: false)

        //create the clockwise wedge, first shifting the center of the wedge
        wedgeCenter.y -= 10
        let clockwiseWedge = Wedge(center: wedgeCenter, radius: 100, start: M_PI_4 * 3, end: M_PI_4, clockwise: true)

        //add the shapes to the canvas
        self.canvas.add(counterClockwiseArc)    //bottom
        self.canvas.add(clockwiseArc)           //top
        self.canvas.add(counterClockwiseWedge)  //bottom
        self.canvas.add(clockwiseWedge)         //top
    }
}