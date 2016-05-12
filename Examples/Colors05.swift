//
//  Colors04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors05: CanvasController {

    var red, green, blue: Shape!

    override func setup() {
        setupShapes()
        setupLabels()

        red.fillColor  = Color(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        green.fillColor  = Color(hue: 0.33, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        blue.fillColor  = Color(hue: 0.66, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

    func setupShapes() {
        let frame = Rect(0, 0, canvas.width*0.9, canvas.height/5)

        red =  Rectangle(frame: frame)
        green = Rectangle(frame: frame)
        blue = Rectangle(frame: frame)

        red.lineWidth = 0.0
        green.lineWidth = 0.0
        blue.lineWidth = 0.0

        let dy = Vector(x: 0, y: canvas.height/4)
        red.center  = canvas.center - dy
        green.center = canvas.center
        blue.center = canvas.center + dy

        canvas.add(red)
        canvas.add(green)
        canvas.add(blue)
    }

    func setupLabels() {
        let f = Font(name: "Helvetica" , size: 30.0)!
        var l:TextShape!

        l = TextShape(text: "{HSBA} : {0.0, 1.0, 1.0, 1.0}", font: f)
        l.fillColor = white
        l.center = red.center
        self.canvas.add(l)

        l = TextShape(text: "{HSBA} : {0.33, 1.0, 0, 1.0}", font: f)
        l.fillColor = white
        l.center = green.center
        self.canvas.add(l)

        l = TextShape(text: "{HSBA} : {0.66, 1.0, 1.0, 1.0}", font: f)
        l.fillColor = white
        l.center = blue.center
        self.canvas.add(l)
    }
}