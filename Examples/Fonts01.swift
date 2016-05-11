//
//  Fonts01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Fonts01: CanvasController {
    override func setup() {
        //create an initial font and a label
        let label = TextShape(text: "Default Font")!
        label.center = Point(canvas.center.x, canvas.height/3)

        //use the initial font to create a new font with a bigger size
        let f = Font(name: "helvetica", size: 30.0)!
        let smallLabel = TextShape(text: "Small Font", font: f)!
        smallLabel.center = Point(canvas.center.x, canvas.height*2/3);

        //add the labels to the canvas
        self.canvas.add(label)
        self.canvas.add(smallLabel)
    }
}
