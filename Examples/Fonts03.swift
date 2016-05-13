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

class Fonts03: CanvasController {
    override func setup() {
        //create an initial font
        var f = Font(name:"BodoniSvtyTwoITCTT-Book", size:45.0)!

        //create an initial label, position it, add it to the canvas
        var p = Point(canvas.center.x, f.lineHeight)

        createTextShape("Font Properties", font: f, center: &p)

        //change the font size
        f = f.font(30.0)

        createTextShape("Family name: \(f.familyName)", font: f, center: &p)
        createTextShape("Font name: \(f.fontName)", font: f, center: &p)
        createTextShape(String(format:"Point size: %.2f", f.pointSize), font: f, center: &p)
        createTextShape(String(format:"Ascender: %.2f", f.ascender), font: f, center: &p)
        createTextShape(String(format:"Descender: %.2f", f.descender), font: f, center: &p)
        createTextShape(String(format:"Cap Height: %.2f", f.capHeight), font: f, center: &p)
        createTextShape(String(format:"X-Height: %.2f", f.xHeight), font: f, center: &p)
        createTextShape(String(format:"Line Height: %.2f", f.lineHeight), font: f, center: &p)
    }

    func createTextShape(text: String, font: Font, inout center: Point) {
        let ts = TextShape(text: text, font: font)!
        ts.center = center
        canvas.add(ts)
        center += Vector(x: 0, y: ts.height + 10)
    }
}
