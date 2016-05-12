//
//  Interaction04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction04: CanvasController {
    
    override func setup() {
        let dx = Vector(x: 100, y: 0)
        let dy = Vector(x: 0, y: 100)

        let c = canvas.center

        let defaultPoints : [Point] = [
            ((c - dx) - dy),
            c - dy,
            (c + dx) - dy,
            c + dx,
            (c + dx) + dy,
            c + dy,
            (c - dx) + dy,
            c - dx]

        var polyPoints = defaultPoints

        let poly = Polygon(polyPoints)
        poly.interactionEnabled = false
        poly.close()
        poly.lineWidth = 40.0
        canvas.add(poly)

        let pan = canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            polyPoints = defaultPoints
            for i in 0..<locations.count {
                polyPoints[i * 2] = locations[i]
            }
            poly.points = polyPoints
            poly.close()
        }

        pan.maximumNumberOfTouches = 4
    }
}
