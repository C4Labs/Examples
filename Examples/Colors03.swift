//
//  Colors03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors03: CanvasController {
    //we use an array of shapes and for() loops to set styles
    var shapes = [Shape]()
    var colors = [black, darkGray, lightGray, gray, red, green, blue, cyan, yellow, magenta, orange, purple, brown, white, clear]
    var labels = ["black", "darkGray", "lightGray", "gray", "red", "green", "blue", "cyan", "yellow", "magenta", "orange", "purple", "brown", "white", "clear"]

    override func setup() {
        //create a frame for building each shape
        let frame = Rect(0, 0, self.canvas.width*0.96, self.canvas.height/18.0)

        //create an array of 15 shapes
        for _ in 0..<15 {
            shapes.append(Rectangle(frame: frame))
        }

        //create a point that we can update to se the position of each object
        let dy = Vector(x: 0, y: canvas.height/16)
        var center = Point(canvas.center.x, dy.y)

        let f = Font(name: "Helvetica", size: 16.0)!
        //for every shape, update its linewidth, position and add it to the canvas
        for i in 0..<shapes.count {
            let shape = shapes[i]
            shapes[i].fillColor = colors[i]
            shape.lineWidth = 0.0
            shape.center = center
            center += dy
            self.canvas.add(shape)

            let ts = TextShape(text: labels[i], font: f)!
            //all labels will be white except the last two
            if(i < 13) {
                ts.fillColor = white
            } else {
                ts.fillColor = C4Purple
                shape.lineWidth = 1.0
            }
            ts.center = shape.bounds.center
            shape.add(ts)
        }
    }
}

