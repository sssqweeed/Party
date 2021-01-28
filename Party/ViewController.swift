//
//  ViewController.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit
@IBDesignable class ViewController: UIViewController {

    var friend: FriendButton!
    var bottomCircle: CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBottomCircle()
        
        friend = FriendButton(type: .custom)
        friend.setOptions(view: view, center: CGPoint(x: view.center.x, y: view.center.y))
        view.addSubview(friend)
        
        //friend.move(to: CGPoint(x: 50, y: 50))
        
//        UIView.animate(withDuration: 1, animations: {
//                        self.friend.center = CGPoint(x: 50, y: 50)
//
//        })
    }

    private func createBottomCircle() {
        bottomCircle = CAShapeLayer()
        
//        let pathCircle = UIBezierPath(arcCenter: centerOfBottomCircle, radius: view.bounds.height/4, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
//
        let pathRect = CGRect(x: -50, y: view.bounds.height * (6/8 + 1/16), width: view.bounds.width + CGFloat(100), height: view.bounds.height / 3)
        let pathCircle = UIBezierPath(ovalIn: pathRect)
        
        bottomCircle.path = pathCircle.cgPath
        bottomCircle.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.layer.addSublayer(bottomCircle)
    }
}

