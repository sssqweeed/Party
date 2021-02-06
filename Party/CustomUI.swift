//
//  CustomUI.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.4040559828, green: 0.1291804314, blue: 0.1513632238, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func move(to point: CGPoint) {
        UIView.animate(withDuration: 0.5, animations:{
            self.center = point
        })
    }
    
    func moveRemove(to point: CGPoint) {
        UIView.animate(withDuration: 0.5, animations:{
            self.center = point
            self.removeFromSuperview()
        })
        
    }
}

@IBDesignable class CustomButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.4040559828, green: 0.1291804314, blue: 0.1513632238, alpha: 1)
        addTarget(self, action: #selector(animationAddDown), for: .touchDown)
        addTarget(self, action: #selector(animationAddUp), for: .touchUpInside)
    }
    
    @IBAction func animationAddDown() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        })
    }
    @IBAction func animationAddUp() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
}

@IBDesignable class CustomUIView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.4040559828, green: 0.1291804314, blue: 0.1513632238, alpha: 1)
    }
}

@IBDesignable class CustomUITextField: UITextField {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 4
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.4040559828, green: 0.1291804314, blue: 0.1513632238, alpha: 1)
    }
}

@IBDesignable class MainView: UIView {
    
    public var bottomCircle: CAShapeLayer!
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        bottomCircle = CAShapeLayer()
        let pathRect = CGRect(x: -50, y: self.bounds.height * (6/8 + 1/16), width: self.bounds.width + CGFloat(100), height: self.bounds.height / 3)
        let pathCircle = UIBezierPath(ovalIn: pathRect)

        bottomCircle.path = pathCircle.cgPath
        bottomCircle.fillColor = #colorLiteral(red: 0.6929730773, green: 0.5930851698, blue: 0.4759702086, alpha: 1)
        layer.insertSublayer(bottomCircle, at: 0)
    }
//    
//    @IBAction private func tapDown(){
//        UIView.animate(withDuration: 0.1, animations: {
//            self.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
//        })
//        exit(0)
//    }
//    
//    @IBAction private func tapUp(){
//        UIView.animate(withDuration: 0.1, animations: {
//            self.transform = CGAffineTransform.identity
//        })
//    }
}
