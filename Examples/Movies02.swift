//
//  Movies02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies02: CanvasController {
    override func setup() {
        //create a movie and play it automatically
        let movie = Movie("halo.mp4")!
        movie.frame = Rect(0,0,300,300)
        movie.center = canvas.center
        movie.play()
        canvas.add(movie)
    }
}
