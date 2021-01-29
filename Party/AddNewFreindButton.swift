//
//  AddNewFreindButton.swift
//  Party
//
//  Created by Михаил Воронин on 29.01.2021.
//

import UIKit
@IBDesignable
class AddNewFreindButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //backgroundColor = #colorLiteral(red: 0.9698982835, green: 0.9545189738, blue: 1, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 0.9698982835, green: 0.9545189738, blue: 1, alpha: 1)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = bounds.height / 2
    }
    
    func animationAddDown() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
            //self.transform = CGAffineTransform.identity
            
        })
    }
    func animationAddUp() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity
            //self.transform = CGAffineTransform.identity
            
        })
    }
}
