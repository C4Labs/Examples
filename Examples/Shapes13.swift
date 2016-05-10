//
//  Shapes13.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//


import UIKit
import C4

class Shapes13: CanvasController {
    var line1:Line!
    var line2:Line!
    
    override func setup() {
        createLines()
        line1.lineDashPattern = [5, 10]
        line2.lineDashPattern = [15, 30]
    }

    func createLines() {
        let dy = Vector(x: 0, y: canvas.height/3)

        //create end points for the first line
        var endPoints = (Point() + dy, Point(canvas.width, 0) + dy)

        //create the first line
        line1 = Line(endPoints)
        line1.lineWidth = 5

        endPoints.0 += dy
        endPoints.1 += dy

        //create the second line
        line2 = Line(endPoints)
        line2.lineWidth = 5

        //add the lines to the canvas
        canvas.add(line1)
        canvas.add(line2)
    }
}