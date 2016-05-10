//
//  Shapes15.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes15: CanvasController {
    override func setup() {
        //create the line and center it
        let points = (Point(0, canvas.center.y), Point(canvas.width, canvas.center.y))
        let line = Line(points)
        line.lineWidth = 100.0
        canvas.add(line)

        //create a dash pattern
        var dashPattern = [Double]()
        for i in Int(line.lineWidth)..<Int(canvas.width + line.lineWidth) {
            dashPattern.append(Double(i))
            dashPattern.append(dashPattern.last!)
        }
        line.lineDashPattern = dashPattern

        let a = ViewAnimation(duration:30.0) {    //duration = 5 minutes (60s * 5 = 300);
            line.strokeColor = C4Pink
            //set the final dash phase to the entire width of the pattern
            line.lineDashPhase = dashPattern.reduce(0, combine: +)
        }

        a.autoreverses = true
        a.repeats = true
        a.animate()
    }
}