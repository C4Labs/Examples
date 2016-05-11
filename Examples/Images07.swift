//
//  Images07.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//


import C4
import UIKit

class Images07: CanvasController {
    override func setup() {
        //we create an array for our color data
        var rawData = [Pixel]()

        let colors = [C4Pink, C4Blue, C4Purple, C4Grey]
        //for every row
        for _ in 0..<Int(canvas.height) {
            //color each pixel in that row
            for _ in 0..<Int(canvas.width) {
                //create a pixel from a random color in our set
//                rawData.append(Pixel(colors[random(below: 4)]))
            }
        }

        let img = Image(pixels: rawData, size: canvas.size)
        img.center = canvas.center
        canvas.add(img)
    }
}
