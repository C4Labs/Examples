//
//  Views15.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views15: CanvasController {
    
    var circles = [Circle]()
    
    override func setup() {
        for i in -1...1 {
            let c = Circle(center: canvas.center + Vector(x: 100, y: 0) * Double(i), radius: 100)
            c.lineWidth = 25
            canvas.add(c)
            circles.append(c)
            c.addTapGestureRecognizer { locations, center, state in
                self.canvas.bringToFront(c)
            }
        }
    }
}
