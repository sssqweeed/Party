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
