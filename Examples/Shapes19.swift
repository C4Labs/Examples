//
//  Shapes19.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes19: CanvasController {
    override func setup() {
        var points = (Point(),Point(canvas.width,0))

        var step = 0.0
        repeat {
            let width = pow(1.1, step)
            //shift the line points based on the current line width (with a little gap)
            let dy = Vector(x: 0, y: width+1)
            points.0 += dy
            points.1 += dy

            let newLine = Line(points)
            newLine.lineWidth = width
            canvas.add(newLine)
            step += 1.0
        } while points.0.y < canvas.height
    }
}
