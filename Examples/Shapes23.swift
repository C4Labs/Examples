//
//  Shapes22.swift
//  Examples
//
//  Created by travis on 2016-05-24.
//  Copyright © 2016 C4. All rights reserved.
//

import UIKit
import C4

class Shapes23: CanvasController {
    override func setup() {
        let star = Star(center: canvas.center, pointCount: 30, innerRadius: 125, outerRadius: 150)
        star.gradientFill = Gradient(frame: star.bounds)
        canvas.add(star)
    }
}
