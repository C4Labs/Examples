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

class Advanced06: CanvasController {
    var image = Image()
    var allRules = [[Bool]]()
    var label: TextShape!
    var images: [Image]!

    override func setup() {
        image.frame = canvas.frame
        canvas.add(image)

        createAllRules()

        let f = Font(name: "Menlo-Regular", size: 12)!
        label = TextShape(text: "Automata", font: f)!
        label.origin = Point(10,10)
        label.fillColor = C4Blue
        canvas.add(label)

        wait(1.0) {
            self.generateNextImage()
        }
    }

    var i = 0
    func generateNextImage() {
        images = [Image]()

        ShapeLayer.disableActions = true
        label.text = "Automata – \(i+1)/256"
        label.origin = Point(10,10)
        if let img = createImage(allRules[i]) {
            images.append(img)
            image.contents = img.contents
        }

        i += 1
        if i < allRules.count {
            wait(0.033) {
                self.generateNextImage()
            }
        }
    }

    func name(rules: [Bool]) -> String {
        var name = ""
        for rule in rules {
            name += "\(Int(rule))"
        }
        return name
    }

    func createAllRules() {
        for a in 0...1 {
            for b in 0...1 {
                for c in 0...1 {
                    for d in 0...1{
                        for e in 0...1 {
                            for f in 0...1 {
                                for g in 0...1 {
                                    for h in 0...1 {
                                        //rules maps to: [000, 001, 010, 011, 100, 101, 110, 111]
                                        allRules.append([Bool(a), Bool(b), Bool(c), Bool(d), Bool(e), Bool(f), Bool(g), Bool(h)])
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    func createImage(rules: [Bool]) -> Image? {
        let w = Int(image.size.width)
        let h = Int(image.size.height)
        var map = Array(count: (w*h), repeatedValue:false)

        map[w/2] = true //try adding random true values to the first row

        for row in 1..<h-1 {
            for col in 1..<w-1 {
                var result = 0b000000
                let idx = (row-1) * w + col - 1
                if map[idx] {
                    result = result &+ 0b000100
                }
                if map[idx+1] {
                    result = result &+ 0b000010
                }
                if map[idx+2] {
                    result = result &+ 0b000001
                }
                map[row*w + col] = rules[result]
            }
        }

        var pixels = [Pixel](count: w*h, repeatedValue: Pixel(0, 0, 138, 255))
        for i in 0..<map.count {
            if map[i] == true {
                pixels[i] = Pixel(255, 0, 121, 255)
            }
        }

        return Image(pixels: pixels, size: Size(w, h))
    }

    func save(image: Image, name: String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let fileUrl = NSURL(fileURLWithPath: documentsPath).URLByAppendingPathComponent("\(name).png")

        if let filePath = fileUrl.path {
            do {
                try UIImagePNGRepresentation(image.uiimage)?.writeToFile(filePath, options: NSDataWritingOptions.AtomicWrite)
            } catch {
                print(error)
            }
        }
    }
}