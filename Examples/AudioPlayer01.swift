//
//  AudioPlayer01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer01: CanvasController {
    let audioPlayer = AudioPlayer("C4Loop.aif")!
    
    override func setup() {
        audioPlayer.loops = true
        audioPlayer.play()
    }
}
