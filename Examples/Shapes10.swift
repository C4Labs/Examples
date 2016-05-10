//
//  Shapes10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes10: CanvasController {
    override func setup() {
        self.setupLines()
        self.setupGridLines()
        self.setupLabels()
    }
    
    func setupLines() {
        //create and style the first line (no need to set the lineCap because we show the default here)
        let dy = Vector(x: 0, y: canvas.height/4.0)
        var points = (Point(canvas.width/4,0) + dy, Point(canvas.width*3/4,0) + dy)

        let line1 = Line(points)
        line1.lineWidth = 30.0

        //create and style the second line
        points.0 += dy
        points.1 += dy
        let line2 = Line(points)
        line2.strokeColor = C4Blue
        line2.lineWidth = 30.0
        line2.lineCap = .Square

        //create and style the third line
        points.0 += dy
        points.1 += dy
        let line3 = Line(points)
        line3.strokeColor = C4Pink
        line3.lineWidth = 30.0
        line3.lineCap = .Butt

        //add all the lines to the canvas
        self.canvas.add(line1)
        self.canvas.add(line2)
        self.canvas.add(line3)
    }
    
    func setupGridLines() {
        //set the points for the first grid line
        var points = (Point(canvas.width/4, 0), Point(canvas.width/4, canvas.height))

        //create the first line and style it with width and a dash pattern
        let gridLine1 = Line(points)
        gridLine1.lineWidth = 1.0
        gridLine1.lineDashPattern = [2]

        //create the second line and style it with width and a dash pattern
        let dx = Vector(x: canvas.center.x, y: 0)
        points.0 += dx
        points.1 += dx
        let gridLine2 = Line(points)
        gridLine2.lineWidth = 1.0
        gridLine2.lineDashPattern = [2]

        //add the lines to the canvas
        self.canvas.add(gridLine1)
        self.canvas.add(gridLine2)
    }
    
    func setupLabels() {
        //create a font to use for all the labels
        let f = Font(name: "Helvetica", size:20)!

        //create, style and add the first label, with text describing its lineCap type
        let dy = Vector(x: 0, y: canvas.height/4.0)
        var l = TextShape(text: ".Round", font: f)!
        l.fillColor = white
        l.center = canvas.center - dy
        self.canvas.add(l)

        //create, style and add the second label, with text describing its lineCap type
        l = TextShape(text: ".Square", font: f)!
        l.fillColor = white
        l.center = canvas.center
        self.canvas.add(l)

        //create, style and add the third label, with text describing its lineCap type
        l = TextShape(text: ".Butt", font: f)!
        l.fillColor = white
        l.center = canvas.center + dy
        self.canvas.add(l)
    }
}