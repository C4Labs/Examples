//
//  Advanced01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced01: CanvasController {
    var pts = (Point(), Point())
    var canvasShapeCount = 0
    
    override func setup() {
        pts = (canvas.center, canvas.center)
        createArc()
    }
    
    func createArc() {
        pts.0 = pts.1
        pts.1 = Point(random01()*self.canvas.width, self.canvas.center.y);

        let up = canvasShapeCount % 2 == 0 ? true : false
        let arc = self.arcBetween(pts, up: up)

        canvas.add(arc)
        canvasShapeCount += 1

        let a = ViewAnimation(duration:1.0) {
            if arc.strokeStart == 1.0 {
                arc.strokeStart = 0.0
            } else {
                arc.strokeEnd = 1.0
            }
        }

        a.addCompletionObserver { 
            self.createArc()
        }
        a.animate()
   }
    
    func arcBetween(points: (Point, Point) ,up:Bool) -> Arc {
        ShapeLayer.disableActions = true

        let s = Arc(center: lerp(points.0, points.1, at: 0.5),
                    radius: distance(points.0, rhs: points.1)/2,
                    start: up ? M_PI : 0,
                    end: up ? 2 * M_PI : M_PI,
                    clockwise: true)
        s.fillColor = clear

        if(points.1.x > points.0.x) {
            if(up) {
                s.strokeEnd = 0.0
            } else {
                s.strokeStart = 1.0
            }
        } else {
            if(up) {
                s.strokeStart = 1.0
            } else {
                s.strokeEnd = 0.0
            }
        }

        if(up) {
            s.strokeColor = C4Pink
        }
        ShapeLayer.disableActions = false

        return s
    }
}
