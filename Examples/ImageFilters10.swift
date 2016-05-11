//
//  ImageFilters10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters10: CanvasController {
    override func setup() {
        let image = Image("chop")!
        image.constrainsProportions = true
        image.width = canvas.width
        canvas.add(image)

        var filter = Twirl()
        filter.center = canvas.center
        filter.angle = 2*M_PI
        filter.radius = 200
        image.apply(filter)
    }
}