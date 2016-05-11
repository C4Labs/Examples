//
//  Shapes21.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes21: CanvasController {
    var a, b, c: UIPanGestureRecognizer!

    override func setup() {
        //create the end points for the bezier curve
        var points = (Point(canvas.width/4, canvas.height/3), Point(canvas.width*3/4,canvas.height/3))

        //create the bezier curve
        let bezier = Curve(begin: points.0, control0: points.0, control1: points.1, end: points.1)
        self.canvas.add(bezier)
        let cA = Circle(center: points.0, radius: 22)
        let cB = Circle(center: points.1, radius: 22)
        cB.fillColor = C4Pink

        points.0.y *= 2.0
        points.1.y *= 2.0
        //create the quadratic curve
        let quad = QuadCurve(begin: points.0, control: lerp(points.0, points.1, at: 0.5), end: points.1)

        self.canvas.add(quad)
        let cC = Circle(center: quad.controlPoint, radius: 22)
        cC.fillColor = C4Purple

        self.canvas.add(cA)
        self.canvas.add(cB)
        self.canvas.add(cC)

        //add drag gestures to the control shapes
        a = cA.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cA.center += translation
            bezier.controlPoints.0 = cA.center
            self.a.setTranslation(CGPointZero, inView: self.canvas.view)
        }

        b = cB.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cB.center += translation
            bezier.controlPoints.1 = cB.center
            self.b.setTranslation(CGPointZero, inView: self.canvas.view)
        }

        c = cC.addPanGestureRecognizer { locations, center, translation, velocity, state in
            cC.center += translation
            quad.controlPoint = cC.center
            self.c.setTranslation(CGPointZero, inView: self.canvas.view)
        }
    }
}