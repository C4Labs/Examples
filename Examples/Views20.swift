//
//  Views20.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views20: CanvasController {
    override func setup() {
        let img = Image("chop")!
        img.constrainsProportions = true
        img.height = canvas.height
        img.center = canvas.center
        canvas.add(img)

        let mask = Rectangle(frame: Rect(0,0,img.height-20,50))
        let submask = Rectangle(frame: Rect(0,0,50,img.height-20))
        submask.center = mask.center
        mask.add(submask)
        mask.center = img.bounds.center
        img.mask = mask

        let a = ViewAnimation(duration: 1.7) {
            mask.transform.rotate(-M_PI)
        }
        let b = ViewAnimation(duration: 2.3) {
            submask.transform.rotate(M_PI_2)
        }
        a.repeats = true
        b.repeats = true
        b.autoreverses = true

        a.animate()
        b.animate()
    }
}
