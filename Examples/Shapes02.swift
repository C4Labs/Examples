//
//  Shapes01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes02: CanvasController {
    override func setup() {
        //create a 2 point array for the line
        let linePts = [Point(0, 0), Point(100, 100)]
        let line = Line(linePts)

        //create a 3 point array for the triangle
        let trianglePts = [Point(0, 100), Point(100, 100), Point(100, 0)]
        let triangle = Triangle(trianglePts)

        //create a 4 point array for the polygon
        let polygonPts = [Point(0, 0), Point(100, 0), Point(100, 100), Point(0, 100)]
        let polygon = Polygon(polygonPts)

        //create an array between 10 and 20 points for the random shape
        var points = [Point]()
        for _ in 0..<random(min: 10, max: 20) {
            points.append(Point(random(below:100), random(below:100)))
        }
        let randomPolygon = Polygon(points)

        //create a displacement vector
        let dx = Vector(x: canvas.width/5.0, y: 0)

        //position all the objects
        
        line.center = Point(0, canvas.center.y) + dx
        triangle.center = line.center + dx
        polygon.center = triangle.center + dx
        randomPolygon.center = polygon.center + dx

        //add shapes to canvas
        self.canvas.add(line)
        self.canvas.add(triangle)
        self.canvas.add(polygon)
        self.canvas.add(randomPolygon)
    }
}
