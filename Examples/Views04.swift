//
//  Views04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views04: CanvasController {
    override func setup() {
        let f = Rect(0,0,200,200)
        let r = Rectangle(frame: f)
        canvas.add(r)
        let e = Ellipse(frame: f)
        e.fillColor = C4Pink
        canvas.add(e)

        r.center = canvas.center
        e.center = r.center
    }
}
