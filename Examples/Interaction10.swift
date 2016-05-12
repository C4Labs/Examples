//
//  Interaction10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-17.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Interaction10: CanvasController {
    override func setup() {
        let r = Rectangle(frame: canvas.frame)
        r.corner = Size()
        canvas.add(r)

        let c = Circle(center: canvas.center, radius: canvas.height/3)
        c.strokeColor = white
        canvas.add(c)

        addSwipes(c)
        addSwipes(r)
    }

    func addSwipes(object: Shape) {
        addSwipe(object, direction: .Right)
        addSwipe(object, direction: .Down)
        addSwipe(object, direction: .Left)
        addSwipe(object, direction: .Up)
    }

    func addSwipe(object: Shape, direction dir: UISwipeGestureRecognizerDirection) {
        let swipe = object.addSwipeGestureRecognizer { (locations, center, state, direction) in
            switch direction {
            case UISwipeGestureRecognizerDirection.Right:
                object.fillColor = C4Blue
            case UISwipeGestureRecognizerDirection.Down:
                object.fillColor = C4Pink
            case UISwipeGestureRecognizerDirection.Left:
                object.fillColor = C4Purple
            default:
                object.fillColor = C4Grey
            }
        }
        swipe.direction = dir
    }
}
