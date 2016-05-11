//
//  Views17.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views17: CanvasController {
    override func setup() {
        let img = Image("chop")!
        img.center = canvas.center
        canvas.add(img)

        img.mask = Circle(center: img.bounds.center, radius: img.height/2)
    }
}
