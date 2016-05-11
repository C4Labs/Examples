//
//  ImageFilters07.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters07: CanvasController {
    override func setup() {
        let image = Image(frame: canvas.frame)
        canvas.add(image)

        var filter = LinearGradient()
        filter.colors = [C4Pink, C4Blue]
        filter.points = [Point(), canvas.center]
        image.generate(filter)
    }
}