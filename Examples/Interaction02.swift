//
//  Interaction.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction02: CanvasController {

    override func setup() {

        let dx = Vector(x: canvas.width/4, y: 0)

        for i in -1...1 {
            let c = Circle(center: canvas.center + (dx * Double(i)), radius: canvas.height/6)
            c.lineWidth = 40.0
            c.addTapGestureRecognizer { locations, center, state in
                self.randomColor(c)
            }
            canvas.add(c)
        }
    }

    func randomColor(shape: Shape) {
        shape.fillColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
        shape.strokeColor = Color(red: random01(), green: random01(), blue: random01(), alpha: 1.0)
    }
}


