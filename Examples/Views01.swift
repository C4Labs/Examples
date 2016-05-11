//
//  Views01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views01: CanvasController {
    override func setup() {
        var origin = Point()
        let size = Size(canvas.width/10, canvas.height)
        let dx = Vector(x: size.width, y: 0)
        repeat {
            let r = Rectangle(frame: Rect(origin, size))
            r.opacity = origin.x/canvas.width
            canvas.add(r)
            origin += dx
        } while origin.x < canvas.width
    }
}
