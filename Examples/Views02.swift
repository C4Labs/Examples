//
//  Views02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views02: CanvasController {
    override func setup() {
        let c = Circle(center: self.canvas.center, radius: 150)
        c.backgroundColor = C4Pink
        canvas.add(c)
    }
}