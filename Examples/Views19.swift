//
//  Views19.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views19: CanvasController {
    override func setup() {
        let img = Image("chop")!
        img.constrainsProportions = true
        img.height = canvas.height
        img.center = canvas.center
        canvas.add(img)

        let mask = Rectangle(frame: Rect(0,0,img.height-20,50))
        mask.center = img.bounds.center
        img.mask = mask

        let a = ViewAnimation(duration: 1.5) {
            mask.transform.rotate(M_PI)
        }
        a.repeats = true
        a.animate()
    }
}
