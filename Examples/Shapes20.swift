//
//  Shapes20.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes20: CanvasController {
    override func setup() {
        let dy = Vector(x: 0, y: 2.0)

        //create and array of points to use for lines
        var points = (Point()-dy,Point(self.canvas.width,0.0)-dy)

        //figure out the total number of lines to draw
        let totalLineCount = self.canvas.height / 2.0 //default line width of 1.0

        //figure out displacement of strokeStart and strokeEnd
        let strokeDisplacement = 0.5 / totalLineCount

        for i in 0..<Int(totalLineCount) {
            points.0 += dy
            points.1 += dy

            //create a new line
            let newLine = Line(points)

            //determine the current displacement of the ends of the line
            let ds = strokeDisplacement*Double(i)
            newLine.strokeStart = 0.5 - ds
            newLine.strokeEnd = 0.5 + ds

            self.canvas.add(newLine)
        }
    }
}