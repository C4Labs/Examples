//
//  Interaction01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction01: CanvasController {

    override func setup() {

        let dy = Vector(x: 0, y: canvas.height/6)

        let top = Circle(center: canvas.center - dy, radius: 50)
        top.fillColor = C4Pink
        canvas.add(top)

        let bottom = Circle(center: canvas.center + dy, radius: 50)
        canvas.add(bottom)

        top.addTapGestureRecognizer { center,location, state in
            top.fillColor = C4Pink
            top.post("tapped")
        }

        bottom.addTapGestureRecognizer { center,location, state in
            bottom.fillColor = C4Blue
            bottom.post("tapped")
        }

        canvas.addTapGestureRecognizer { center,location, state in
            self.canvas.backgroundColor = C4Grey
            top.fillColor = C4Grey
            bottom.fillColor = C4Grey
        }

        on(event: "tapped", from: top) {
            self.canvas.backgroundColor = top.fillColor
        }

        on(event: "tapped", from: bottom) {
            self.canvas.backgroundColor = bottom.fillColor
        }
    }
}
