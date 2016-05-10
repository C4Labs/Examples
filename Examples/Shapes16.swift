//
//  Shapes16.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes16: CanvasController {
    override func setup() {
        //create the circle and center it
        let circle = Circle(center: self.canvas.center, radius: 150)
        circle.lineWidth = 10.0
        circle.fillColor = Color(UIColor.clearColor())

        //create a dash pattern
        var dashPattern = [Double]()
        let circumference = M_PI * circle.width
        for i in 1..<Int(circumference) {
            dashPattern.append(Double(i))
        }

        circle.lineDashPattern = dashPattern
        //add the line to the canvas
        self.canvas.add(circle)
        //animate it after a short wait
        let a = ViewAnimation(duration:30) {    //duration = 3 minutes (60s * 3 = 180);
            circle.strokeColor = C4Pink
            //set the final dash phase to the entire width of the pattern
            circle.lineDashPhase = dashPattern.reduce(0, combine: +)
        }

        a.autoreverses = true
        a.animate()
    }
    
}