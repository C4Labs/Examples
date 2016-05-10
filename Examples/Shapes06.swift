//
//  Shapes06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Shapes06 : CanvasController {
    override func setup() {
        //create a variable rect
        var f = Rect(0,0,200,200)

        //position the frame, create the default shape
        f.center = Point(canvas.width/3, canvas.center.y)
        let shape = Ellipse(frame: f)

        //position the frame, create the custom shape
        f.center = Point(canvas.width*2/3, canvas.center.y)
        let custom = Ellipse(frame: f)

        //you can cast from a UIColor to a C4 Color
        //set the fill and stroke colors for the custom shape
        custom.fillColor = Color(UIColor.greenColor())
        custom.strokeColor = Color(UIColor.magentaColor())

        //add the shapes to the canvas
        self.canvas.add(shape)
        self.canvas.add(custom)
    }
}