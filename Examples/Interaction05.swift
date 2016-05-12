//
//  Random01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-17.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Interaction05: CanvasController {
    override func setup() {
        let shape = Rectangle(frame: Rect(0, 0, 240, 80))
        shape.lineWidth = 40.0
        canvas.add(shape)

        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            ShapeLayer.disableActions = true
            shape.rotation = (self.canvas.center.x - center.x) / self.canvas.center.x * 2*M_PI
            shape.center = center
        }
    }
}
