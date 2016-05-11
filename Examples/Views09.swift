//
//  Views09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Views09: CanvasController {
    override func setup() {
        let circle = Circle(center: self.canvas.center, radius: 120)
        circle.lineWidth = 100
        canvas.add(circle)
        canvas.addTapGestureRecognizer { (center, location, state) -> () in
            circle.masksToBounds = !circle.masksToBounds
        }
    }
}

