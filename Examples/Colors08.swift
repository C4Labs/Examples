//
//  Colors08.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors08: CanvasController {
    override func setup() {
        let f = Rect(0,0,200,200)
        let rect = Rectangle(frame: f)
        rect.lineWidth = 50.0
        rect.center = canvas.center
        canvas.add(rect)

        rect.strokeColor = Color("pattern1")
        rect.fillColor = Color("pattern2")
    }
}

