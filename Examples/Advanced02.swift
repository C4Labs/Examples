//
//  Advanced02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Advanced02: CanvasController {
    var line = Line((Point(), Point()))
    override func setup() {
        line.endPoints.0 = canvas.center
        line.lineWidth = 40.0
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            self.line.endPoints.1 = center
            if state == .Began {
                self.canvas.add(self.line)
            } else if state == .Ended {
                self.canvas.remove(self.line)
            }
        }
    }
}
