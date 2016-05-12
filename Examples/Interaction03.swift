//
//  Interaction04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction03: CanvasController {
    
    override func setup() {
        let c = Circle(center: canvas.center, radius: canvas.height/3)
        c.lineWidth = 40.0
        c.addLongPressGestureRecognizer { locations, center, state in
            switch state {
            case .Began, .Changed:
                self.randomColor(c)
            default:
                c.fillColor = C4Blue
                c.strokeColor = C4Purple
            }
        }
        canvas.add(c)
    }

    func randomColor(shape: Shape) {
        shape.fillColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
        shape.strokeColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
    }
}