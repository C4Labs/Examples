//
//  Images05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//


import C4
import UIKit

class Images05 : CanvasController {
    override func setup() {
        let chop = Image("chop")!
        let rockies = Image("rockies")!

        let visibleImage = Image(c4image: chop)
        visibleImage.constrainsProportions = true
        visibleImage.width = canvas.width
        canvas.add(visibleImage)

        var isFirst = true
        canvas.addTapGestureRecognizer { (center, location, state) -> () in
            if isFirst {
                visibleImage.contents = rockies.contents
            } else {
                visibleImage.contents = chop.contents
            }
            isFirst = !isFirst
        }
    }
}