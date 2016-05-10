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
        var isCircle = true

        let circle = Circle(center: canvas.center, radius: 100)
        let square = Rectangle(frame: circle.frame)

        let container = Shape(frame: circle.frame)
        container.path = circle.path
        canvas.add(container)

        canvas.addTapGestureRecognizer { (center, location, state) -> () in
            if isCircle {
                container.path = square.path
            } else {
                container.path = circle.path
            }
            isCircle = !isCircle
        }
    }
}
