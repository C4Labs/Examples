//
//  AudioPlayer04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer04: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    override func setup() {
        audioPlayer.enableRate = true
        audioPlayer.rate = 0.25
        audioPlayer.play()
    }
}