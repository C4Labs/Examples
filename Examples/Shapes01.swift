//
//  Shapes01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes01: CanvasController {
    override func setup() {
        let rectangle = Rectangle(frame: Rect(0, 0, 100, 200)) //Create a rectangle
        let square = Rectangle(frame: Rect(0, 0, 100, 100)) //Create a square (same w & h)
        let ellipse = Ellipse(frame: rectangle.frame) // same dimensions as rectangle //Create an ellipse
        let circle = Circle(center: Point(0, 0), radius: 50) // same dimensions as square //Create a circle (same w & h)

        //Figure out the horizontal whitespace (i.e. the space between shapes and the edges of the canvas)
        var whiteSpace = self.canvas.width - 4 * rectangle.width

        whiteSpace = whiteSpace/5 // because there are 5 gaps

        //Create a displacement vector
        let dx = Vector(x: whiteSpace + rectangle.width, y: 0)

        //center all the shapes to the canvas
        var center = Point()
        center.y = self.canvas.center.y

        //set the x position for the rectangle
        center.x = whiteSpace + rectangle.width/2
        rectangle.center = center

        //set the x position for the square
        center += dx
        square.center = center

        //set the x position for the circle
        center += dx
        circle.center = center

        //set the x position for the ellipse
        center += dx
        ellipse.center = center

        //add all the objects to the canvas
        self.canvas.add(rectangle)
        self.canvas.add(square)
        self.canvas.add(circle)
        self.canvas.add(ellipse)
    }
}
