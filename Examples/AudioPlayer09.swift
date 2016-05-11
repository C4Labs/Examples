//
//  AudioPlayer09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer09: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    var meterUpdateTimer:NSTimer!
    var avgL, avgR, peakL, peakR: Line!

    override func setup() {
        audioPlayer.play()
        audioPlayer.loops = true
        audioPlayer.meteringEnabled = true
        audioPlayer.play()

        let dx = Vector(x: canvas.width/4.0, y: 0)

        var points = (Point(0, canvas.height), Point())
        points.0 += dx/2.0
        points.1 += dx/2.0

        avgL = Line(points)
        avgL.lineCap = .Butt
        avgL.lineWidth = dx.x
        avgL.strokeColor = C4Pink
        points.0 += dx
        points.1 += dx

        avgR = Line(points)
        avgR.lineCap = .Butt
        avgR.lineWidth = dx.x
        avgR.strokeColor = C4Pink
        points.0 += dx
        points.1 += dx

        peakL = Line(points)
        peakL.lineCap = .Butt
        peakL.lineWidth = dx.x
        points.0 += dx
        points.1 += dx

        peakR = Line(points)
        peakR.lineCap = .Butt
        peakR.lineWidth = dx.x
        points.0 += dx
        points.1 += dx

        canvas.add(avgL)
        canvas.add(avgR)
        canvas.add(peakL)
        canvas.add(peakR)

        let t = Timer(interval: 1/30.0) {
            self.updateMeters()
        }
        t.start()
    }
    
    func updateMeters() {
        ShapeLayer.disableActions = true
        audioPlayer.updateMeters()
        avgL.strokeEnd = pow(10, 0.05 * audioPlayer.averagePower(0))
        avgR.strokeEnd = pow(10, 0.05 * audioPlayer.averagePower(1))
        peakL.strokeEnd = pow(10, 0.05 * audioPlayer.peakPower(0))
        peakR.strokeEnd = pow(10, 0.05 * audioPlayer.peakPower(1))
        ShapeLayer.disableActions = false
    }
}
