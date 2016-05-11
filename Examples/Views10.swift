//
//  Views10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views10: CanvasController {
    override func setup() {
        let c = Circle(center: canvas.center, radius: 100)
        canvas.add(c)
        
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            c.center = center
        }
    }
}
