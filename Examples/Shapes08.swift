//
//  Shapes08.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes08: CanvasController {
    override func setup() {
        //create a circle
        let circle = Circle(center: self.canvas.center, radius: 100)

        //change the line width
        circle.lineWidth = 10

        //add it to the canvas
        canvas.add(circle)
    }
}

