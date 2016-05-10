//
//  ViewController.swift
//  Examples
//
//  Created by travis on 2016-05-10.
//  Copyright © 2016 C4. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {
    override func setup() {
        let example = Shapes19()
        self.addChildViewController(example)
        canvas.add(example.canvas)
    }
}

