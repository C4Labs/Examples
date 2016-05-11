//
//  Views13.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views13: CanvasController {
    override func setup() {
        canvas.backgroundColor = white
        let points = [Point(), Point(canvas.center.x, 0), Point(0, canvas.center.y), canvas.center]
        for p in points {
            let r = Rectangle(frame: Rect(p, Size(canvas.width/2,canvas.height/2)))
            if p != points.first && p != points.last {
                r.fillColor = C4Pink
            }
            r.corner = Size()
            r.lineWidth = 25.0
            r.addTapGestureRecognizer { locations, center, state in
                self.remove(r)
            }
            canvas.add(r)
        }
    }

    func remove(shape: Shape) {
        shape.removeFromSuperview()
        wait(1.0) {
            self.canvas.add(shape)
        }
    }
}
