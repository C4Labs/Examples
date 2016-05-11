//
//  AudioPlayer03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer03: CanvasController {
    
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    
    override func setup() {
        let font = Font(name: "Helvetica", size: 30.0)!
        //create text shape to display duration of mp3

        let dur = TextShape(text: "Duration: \(audioPlayer.duration)s", font: font)!
        dur.center = canvas.center - Vector(x: 0, y: dur.height)
        canvas.add(dur)

        let cur = TextShape(text: "Current: \(audioPlayer.currentTime)s", font: font)!
        cur.center = canvas.center + Vector(x: 0, y: cur.height)
        canvas.add(cur)

        let t = Timer(interval: 1.0/60.0) {
            ShapeLayer.disableActions = true
            let c = cur.center
            cur.text = String(format: "Current: %.2fs", self.audioPlayer.currentTime)
            cur.center = c
            ShapeLayer.disableActions = false
        }
        t.start()

        audioPlayer.loops = true
        audioPlayer.play()
    }
}
