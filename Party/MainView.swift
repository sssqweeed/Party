//
//  MainView.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit

@IBDesignable class MainView: UIView {

    override func draw(_ rect: CGRect) {
        var bottomCircle: CAShapeLayer!
        bottomCircle = CAShapeLayer()
        
        let pathRect = CGRect(x: -50, y: self.bounds.height * (6/8 + 1/16), width: self.bounds.width + CGFloat(100), height: self.bounds.height / 3)
        let pathCircle = UIBezierPath(ovalIn: pathRect)
        
        bottomCircle.path = pathCircle.cgPath
        bottomCircle.fillColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        
        self.layer.addSublayer(bottomCircle)
    }
    
}
