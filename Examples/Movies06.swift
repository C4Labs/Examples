//
//  Movies06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies06: CanvasController {
    override func setup() {
        let color = Movie("halo.mp4")!
        let gray = Movie("haloGray.mp4")!

        color.frame = canvas.frame
        color.play()

        gray.frame = canvas.frame
        gray.muted = true
        gray.play()

        let g = Gradient(frame: gray.bounds)
        g.colors = [clear, white]
        g.locations = [0, 0.5]
        g.endPoint = Point(1,1)
        gray.mask = g

        canvas.add(color)
        canvas.add(gray)
    }
}