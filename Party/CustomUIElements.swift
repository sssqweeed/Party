//
//  CustomLabel.swift
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
        layer.borderColor = #colorLiteral(red: 0.06815902889, green: 0.286996752, blue: 0.4266326427, alpha: 1)
    }
}

@IBDesignable class CustomButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.06815902889, green: 0.286996752, blue: 0.4266326427, alpha: 1)
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
        layer.borderColor = #colorLiteral(red: 0.06815902889, green: 0.286996752, blue: 0.4266326427, alpha: 1)
    }
}

@IBDesignable class CustomUITextField: UITextField {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 4
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.06815902889, green: 0.286996752, blue: 0.4266326427, alpha: 1)
    }
}


