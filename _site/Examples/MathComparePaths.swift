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

class MathComparePaths: View {

    var whitePath: Shape?
    var grayPath: Shape?
    var maskPath: Shape?
    var button: Shape?
    var gradient: Gradient?

    var mainPoints: [Point]?
    var modifiedPoints: [Point]?
    var distances = [0.0]
    var totalDistance = 0.0
    var dIndex = 0.0
    var insetFrame = Rect()

    convenience init(frame: Rect, insetFrame: Rect, points: [Point], modifiedPoints: [Point]) {
        self.init()
        self.frame = frame
        self.insetFrame = insetFrame
        self.mainPoints = points
        self.modifiedPoints = modifiedPoints

        transformPoints()
        calculateDistances()
        createMaskPath()
        createGradient()
        createWhitePath()
        createGrayPath()
        createButton()

        self.add(gradient)
        self.add(whitePath)
        self.add(grayPath)
        self.add(button)
    }

    func transformPoints() {
        assert(mainPoints != nil, "mainPoints couldn't be extracted")

        var t = Transform.makeTranslation(Vector(x: insetFrame.origin.x, y: insetFrame.center.y))
        t.scale(insetFrame.size.width, insetFrame.size.height/2.0)

        for i in 0..<mainPoints!.count {
            mainPoints![i].transform(t)
            modifiedPoints![i].transform(t)
        }
    }

    func calculateDistances() {
        if let mp = modifiedPoints {
            var prev = mp.first!
            for i in 1..<mp.count {
                let curr = mp[i]
                var d = distance(prev, rhs: curr)
                d += distances.last!
                distances.append(d)
                prev = curr
            }

            dIndex = Double(distances.count) / 100.0
            totalDistance = distances.last!
        }
    }

    func createGradient() {
        let gr = Gradient(frame: frame)
        gr.colors = [C4Blue, C4Purple]
        gr.locations = [0, 1]
        gr.startPoint = Point(insetFrame.origin.x/width, 0)
        gr.endPoint = Point(insetFrame.max.x/width, 0)
        gradient = gr
        gradient?.layer?.mask = maskPath?.layer
    }

    func createMaskPath() {
        let mp = Polygon(modifiedPoints!)
        mp.lineWidth = 35.0
        mp.fillColor = clear
        mp.strokeEnd = 0.00001
        maskPath = mp
    }

    func createWhitePath() {
        let wp = Polygon(modifiedPoints!)
        wp.lineWidth = 2.0
        wp.fillColor = clear
        wp.strokeColor = white
        wp.opacity = 0.15
        whitePath = wp
    }

    func createGrayPath() {
        let gp = Polygon(mainPoints!)
        gp.lineWidth = 3.0
        gp.fillColor = clear
        gp.strokeColor = black
        gp.opacity = 0.1
        grayPath = gp
    }

    func createButton() {
        var s = Shadow()
        s.offset = Size(0, 2)
        s.radius = 1
        s.opacity = 0.5

        let b = Circle(center: modifiedPoints!.first!, radius: 15)
        b.fillColor = white
        b.strokeColor = clear
        b.shadow = s

        let kfa = CAKeyframeAnimation()
        kfa.path = maskPath?.path?.CGPath
        kfa.duration = 1.0
        kfa.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        b.layer?.addAnimation(kfa, forKey: "position")
        b.layer?.speed = 0.0
        button = b

        button?.addPanGestureRecognizer { (center, location, translation, velocity, state) -> () in
            guard let b = self.button else {
                print("Could not extract button")
                return
            }

            ShapeLayer.disableActions = true
            var x = self.convert(location, from: b).x - self.insetFrame.origin.x
            x = clamp(x, min: 0, max: self.insetFrame.size.width-0.01)
            x /= self.insetFrame.size.width
            let index = Int(x * 100.0 * self.dIndex)
            b.layer?.timeOffset = CFTimeInterval(clamp(x, min: 0, max: 1.0))

            self.maskPath?.strokeEnd = clamp(self.distances[index]/self.totalDistance, min: 0.00001, max: 1.0)

            if state == .Ended {
                if let pl = b.layer?.presentationLayer() as? CALayer {
                    b.center = Point(pl.position)
                }
            }
        }
    }
}
