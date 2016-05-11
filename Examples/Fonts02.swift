//
//  Fonts02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Fonts02: CanvasController {
    override func setup() {
        let dy = Vector(x: 0, y: canvas.height/4)
        //create a regular system font
        var label = TextShape(text: "Regular System Font", font: Font.systemFont(30.0))!
        label.center = canvas.center - dy
        canvas.add(label)

        //create a bold system font
        label = TextShape(text: "Bold System Font", font: Font.boldSystemFont(30.0))!
        label.center = canvas.center
        canvas.add(label)

        //create a italic system font
        label = TextShape(text: "Italic System Font", font: Font.italicSystemFont(30.0))!
        label.center = canvas.center + dy
        canvas.add(label)
    }
}