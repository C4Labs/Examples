//
//  Views23.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Views23: CanvasController {
    override func setup() {
        let dx = Vector(x: canvas.width/4, y: 0)

        let c1 = Circle(center: canvas.center - dx, radius: 66)
        let c2 = Circle(center: canvas.center, radius: 66)
        let c3 = Circle(center: canvas.center + dx, radius: 66)

        c1.shadow.opacity = 0.8
        c2.shadow.opacity = 0.8
        c3.shadow.opacity = 0.8

        c1.shadow.offset = Size(10,10)
        c2.shadow.offset = Size(16,20)
        c3.shadow.offset = Size(22,28)

        c1.shadow.radius = 3.0
        c2.shadow.radius = 6.0
        c3.shadow.radius = 9.0

        c2.shadow.color = C4Pink
        c3.shadow.color = C4Blue

        canvas.add(c1)
        canvas.add(c2)
        canvas.add(c3)
    }
}
