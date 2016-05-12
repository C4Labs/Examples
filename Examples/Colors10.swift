//
//  Colors10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-17.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Colors10: CanvasController {
    override func setup() {
        let circle = Circle(center: self.canvas.center, radius: 100)
        circle.fillColor = Color(0xFF3300)
        circle.strokeColor = Color(0x3366FF)
        circle.lineWidth = 50.0
        canvas.add(circle)
    }
}