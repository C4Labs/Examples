//
//  AudioPlayer02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer02: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!

    override func setup() {
        audioPlayer.loops = true
        pause()
        canvas.addTapGestureRecognizer { locations, center, state in
            self.audioPlayer.playing ? self.pause() : self.play()
        }
    }

    func play() {
        canvas.backgroundColor = C4Blue
        audioPlayer.play()
    }

    func pause() {
        canvas.backgroundColor = C4Pink
        audioPlayer.pause()
    }
}