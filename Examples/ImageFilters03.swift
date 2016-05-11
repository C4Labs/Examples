//
//  ImageFilters03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters03: CanvasController {
    override func setup() {
        let image = Image(frame: canvas.frame)
        image.center = canvas.center
        canvas.add(image)

        var filter = Checkerboard()
        filter.center = canvas.center
        filter.colors = [C4Pink, C4Blue]
        filter.sharpness = 1.0
        filter.width = 5.0
        image.generate(filter)
    }
}