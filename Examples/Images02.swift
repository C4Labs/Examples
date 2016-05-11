//
//  Images02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Images02 : CanvasController {
    override func setup() {
        let normal = Image("chop")!
        normal.opacity = 0.75
        normal.center = canvas.center

        let tall = Image(c4image: normal)
        tall.height = canvas.height
        tall.opacity = 0.75
        tall.center = canvas.center

        let wide = Image(c4image: normal)
        wide.width = canvas.width
        wide.opacity = 0.75
        wide.center = canvas.center

        let full = Image(c4image: normal)
        full.frame = canvas.frame
        normal.opacity = 0.75
        self.canvas.add(full)

        canvas.add(full)
        canvas.add(tall)
        canvas.add(wide)
        canvas.add(normal)
    }
}