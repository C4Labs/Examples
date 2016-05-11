//
//  ImageFilters04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters04: CanvasController {
    override func setup() {
        let image = Image("chop")!
        image.constrainsProportions = true
        image.width = canvas.width
        canvas.add(image)

        var filter = DotScreen()
        filter.center = canvas.center
        filter.width = 5
        filter.sharpness = 100
        image.apply(filter)
    }
}