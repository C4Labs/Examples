//
//  Colors02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors02: CanvasController {

    override func setup() {
        let dy = Vector(x: 0, y: canvas.height/5)

        var frame = Rect(Point(), Size(canvas.width * 0.9, canvas.height/6))
        frame.center = Point(canvas.center.x, dy.y)

        let blue = generateRect(frame, text: "C4Blue")
        canvas.add(blue)

        frame.center += dy
        let pink = generateRect(frame, text: "C4Pink")
        pink.fillColor = C4Pink

        frame.center += dy
        let purple = generateRect(frame, text: "C4Purple")
        purple.fillColor = C4Purple

        frame.center += dy
        let gray = generateRect(frame, text: "C4Grey")
        gray.fillColor = C4Grey
    }

    func generateRect(frame: Rect, text: String) -> Rectangle {
        let rect = Rectangle(frame: frame)
        canvas.add(rect)
        let label = TextShape(text: text, font: Font(name: "Helvetica", size: 20)!)!

        label.fillColor = text == "C4Grey" ? C4Purple : C4Grey

        label.center = rect.bounds.center
        rect.add(label)
        return rect
    }
}

