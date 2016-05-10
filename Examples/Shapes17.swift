//
//  Shapes17.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes17: CanvasController {

    override func setup() {
        //create the square and center it
        var f = Rect(0, 0, 250, 250)
        f.center = canvas.center

        let rect = Rectangle(frame: f)
        rect.lineWidth = 10.0
        rect.fillColor = clear
        rect.lineCap = .Round
        rect.lineDashPattern = [5, 20]
        canvas.add(rect)

        let star = Star(center: canvas.center, pointCount: 5, innerRadius: 50, outerRadius: 100)
        //style the text shape and set its dash pattern
        star.fillColor = clear
        star.lineWidth = 5.0
        star.lineDashPattern = [1, 10]

        //add the text shape to the canvas
        canvas.add(star)

        //animate it after a short wait
        let anim = ViewAnimation(duration:10.0) {    //duration = 3 minutes (60s * 3 = 180);
            rect.strokeColor = C4Pink
            star.strokeColor = C4Grey

            //set the final dash phase to the entire width of the pattern
            rect.lineDashPhase = self.canvas.width
            star.lineDashPhase = self.canvas.width
        }
        
        anim.autoreverses = true
        anim.repeats = true
        anim.animate()
    }
}