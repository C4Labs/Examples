//
//  Fonts05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-11.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Fonts05: CanvasController {
    override func setup() {
        let scrollview = UIScrollView(frame: view.frame)
        canvas.add(scrollview)

        //This example is best for iPad / iPad simulator
        //get all the family names
        let familyNamesArray = Font.familyNames()

        var point = Point(canvas.center.x, 10)

        //cycle thought all the family names, creating labels for each one
        for familyName in familyNamesArray {
            let fontNames = Font.fontNames(familyName as! String) // swiftlint:disable:this force_cast
            for fontName in fontNames {
                let f = Font(name: fontName as! String, size: 22.0)! // swiftlint:disable:this force_cast
                let l = TextShape(text: fontName as! String, font: f)! // swiftlint:disable:this force_cast
                l.center = point
                point.y += 30
                scrollview.add(l)
                scrollview.contentSize = CGSizeMake(1, CGFloat(l.origin.y + l.height))
            }
        }
    }
}