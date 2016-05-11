//
//  ImageFilters06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters06: CanvasController {
    override func setup() {
        let image = Image("rockies")!
        image.constrainsProportions = true
        image.width = canvas.width
        image.center = canvas.center
        canvas.add(image)

        var filter = Hue()
        filter.angle = M_PI
        image.apply(filter)
    }
}