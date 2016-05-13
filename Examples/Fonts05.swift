// Copyright © 2016 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

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
                scrollview.contentSize = CGSize(width: 1, height: CGFloat(l.origin.y + l.height))
            }
        }
    }
}
