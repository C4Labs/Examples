//
//  Shapes18.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes18: CanvasController {
    override func setup() {
        let small = Star(center: canvas.center, pointCount: 25, innerRadius: 50, outerRadius: 100)
        let large = Star(center: canvas.center, pointCount: 25, innerRadius: 150, outerRadius: 100)
        canvas.add(small)

        let a = ViewAnimation(duration: 1.0) {
            small.path = large.path
            small.center = self.canvas.center
            small.fillColor = C4Pink
        }
        a.autoreverses = true
        a.repeats = true
        a.animate()
    }
}
