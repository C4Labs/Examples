//
//  AudioPlayer06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer06: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    var bar: Rectangle!
    var barFill: Rectangle!

    override func setup() {
        audioPlayer.loops = true
        audioPlayer.play()
        createIndicators()

        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            self.audioPlayer.volume = center.x / self.canvas.width
            self.updateBar(center)
        }
    }

    func updateBar(point: Point) {
        barFill.origin = Point(point.x-canvas.width,0)
    }

    func createIndicators() {
        let trianglePoints = [Point(0, canvas.height), Point(canvas.width, 0), Point(canvas.width, canvas.height)]
        let barMask = Triangle(trianglePoints)

        bar = Rectangle(frame: canvas.frame)
        bar.interactionEnabled = false
        bar.lineWidth = 0
        bar.fillColor = clear
        bar.mask = barMask
        canvas.add(bar)

        barFill = Rectangle(frame: bar.bounds)
        barFill.corner = Size()
        barFill.lineWidth = 5.0
        barFill.strokeColor = barFill.fillColor
        bar.add(barFill)

        var points = (Point(), Point(0, canvas.height))
        let dx = Vector(x: 8, y: 0)
        repeat {
            let line = Line(points)
            line.strokeColor = C4Pink
            bar.add(line)
            points.0 += dx
            points.1 += dx
        } while points.0.x < canvas.width
    }
}