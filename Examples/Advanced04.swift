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

class Advanced04: CanvasController {
    var image = Image()
    var allRules = [[Bool]]()
    var label: TextShape!
    var images = [Image]()
    var count = 0

    override func setup() {
        //create an empty image, we'll set its contents with each iteration
        image.frame = canvas.frame
        canvas.add(image)

        createAllRules()

        //create the label
        let f = Font(name: "Menlo-Regular", size: 12)!
        label = TextShape(text: "Automata", font: f)!
        label.origin = Point(10, 10)
        label.fillColor = C4Blue
        canvas.add(label)

        //initiate the generation of images
        wait(1.0) {
            self.generateNextImage()
        }
    }

    func generateNextImage() {
        //temporarily suspend animations
        ShapeLayer.disableActions = true
        //update the label
        label.text = "Automata – \(count+1)/256"
        label.origin = Point(10, 10)

        //create an image from the current rule
        if let img = createImage(allRules[count]) {
            images.append(img)
            image.contents = img.contents
        }

        count += 1
        if count < allRules.count {
            //wait a tiny bit between iterations
            //this slows everything down so that the interface can keep up
            //i.e. so the user can see progress
            wait(0.033) {
                self.generateNextImage()
            }
        } else {
            //when all the images have been generated...
            //save them using a specified prefix
            exportImages("singleCentered")
        }
    }

    //create all the rules
    func createAllRules() {
        allRules.removeAll()
        let falseBranch = addRules([[false]])
        let trueBranch = addRules([[true]])
        allRules = falseBranch + trueBranch
    }

    //recursively add rules
    //each rule considers the 3 pixels above the current one so...
    //we have two options true / false for each condition
    //for each rule set there are 8 conditions: 000, 001, 010, 011, 100, 101, 110, 111
    //giving us 2^8 sets of rules ~256
    func addRules(rules: [[Bool]]) -> [[Bool]] {
        if rules[0].count == 8 {
            return rules
        } else {
            var falseRules = rules
            for i in 0..<falseRules.count {
                falseRules[i].append(false)
            }
            falseRules = addRules(falseRules)

            var trueRules = rules
            for i in 0..<trueRules.count {
                trueRules[i].append(true)
            }
            trueRules = addRules(trueRules)

            return falseRules + trueRules
        }
    }

    func createImage(rules: [Bool]) -> Image? {
        //convert size to integers
        let w = Int(image.size.width)
        let h = Int(image.size.height)

        //create an array of false values
        var map = Array(count: (w*h), repeatedValue:false)

        //set a single point to true on the first line
        //NOTE: You can try adding random true values to the first row in other positions
        map[w/2] = true

        //for every row, from the second to the second-last
        for row in 1..<h-1 {
            //for every column from the second to the second last
            for col in 1..<w-1 {
                //let the initial result = 0
                var result = 0b000000
                //check the three pixels above the current pixel
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
                //update the current map value based on the calculated result
                map[row*w + col] = rules[result]
            }
        }

        //create an array of C4Purple pixels
        var pixels = [Pixel](count: w*h, repeatedValue: Pixel(0, 0, 138, 255))
        //update the pixels array, mapping true values to C4Pink
        for i in 0..<map.count {
            if map[i] == true {
                pixels[i] = Pixel(255, 0, 121, 255)
            }
        }
        //create and return an image from the pixels array
        return Image(pixels: pixels, size: Size(w, h))
    }

    func exportImages(prefix: String) {
        //for every image in our generated image set
        for i in 0..<images.count {
            //grab the image
            let image = images[i]
            //grab the corresponding rule
            let rule = allRules[i]
            //generate a name from the provided prefix, and the current rule
            var name = prefix
            for i in 0..<rule.count {
                name += "\(Int(rule[i]))"
            }
            //save the image
            save(image, name: name)
        }
    }

    func save(image: Image, name: String) {
        //grab the app's documents path
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
                                                                .UserDomainMask,
                                                                true)[0]
        //create a file url for saving the image
        var fileUrl = NSURL(fileURLWithPath: documentsPath)
        fileUrl = fileUrl.URLByAppendingPathComponent("\(name).png")

        //try saving the image
        if let filePath = fileUrl.path {
            do {
                guard let data = UIImagePNGRepresentation(image.uiimage) else {
                    print("could not extract png data from image")
                    return
                }
                try data.writeToFile(filePath, options: NSDataWritingOptions.AtomicWrite)
            } catch {
                print(error)
            }
        }
    }
}
