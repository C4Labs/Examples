//
//  Shapes22.swift
//  Examples
//
//  Created by travis on 2016-05-24.
//  Copyright © 2016 C4. All rights reserved.
//

import UIKit
import C4

class Shapes22: CanvasController {
    override func setup() {
        let dx = Vector(x: canvas.width/5, y: 0)

        let star = Star(center: canvas.center - dx, pointCount: 20, innerRadius: 80, outerRadius: 100)

        let hexagon = RegularPolygon(center: canvas.center + dx, radius: 90, sides: 6, phase: 0)

        canvas.add(star)
        canvas.add(hexagon)
    }
}
