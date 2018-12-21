import UIKit
import Foundation

func setGradientBg(color1: UIColor!, color2: UIColor!, frame: CGRect) -> CAGradientLayer{
    let gradient = CAGradientLayer()
    gradient.frame =  frame
    gradient.colors = [color1.cgColor, color2.cgColor]
    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradient.type = .axial
    return gradient
}

let testView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

let gFrame = setGradientBg(color1: UIColor.red,
              color2: UIColor.yellow, frame: testView.frame)
testView.layer.addSublayer(gFrame)


if let gradientLayer = testView.layer.sublayers?[0] {
    gradientLayer.cornerRadius = 20
    gradientLayer.shadowRadius = 4
    testView.layer.insertSublayer(gradientLayer, at: 0)
}

testView
