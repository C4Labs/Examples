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
        let normal = Image("rockies")!
        normal.center = canvas.center

        let tall = Image(c4image: normal)
        tall.height = canvas.height
        tall.center = canvas.center

        let wide = Image(c4image: normal)
        wide.width = canvas.width
        wide.center = canvas.center

        let full = Image(c4image: normal)
        full.frame = canvas.frame
        self.canvas.add(full)

        let images = [normal, tall, wide, full]
        for img in images {
            img.opacity = 0.66
            img.border.color = white
            img.border.width = 0.5
        }

        canvas.add(full)
        canvas.add(tall)
        canvas.add(wide)
        canvas.add(normal)
    }
}