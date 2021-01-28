//
//  FriendButton.swift
//  testDynObj
//
//  Created by Михаил Воронин on 27.01.2021.
//

import UIKit

class FriendButton: UIButton, CAAnimationDelegate {


    private var isSelectedUser = false
    

    
    func setOptions(view: UIView, center: CGPoint) {
        bounds = view.bounds
        self.center = center
        frame = CGRect(x: center.x - 50, y: center.y - 50, width: 100, height: 100)
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
       
        addTarget(self, action: #selector(animateSelectedUser), for: [.touchDown, .touchDragEnter])
        
        
    }
    
    @IBAction private func animateSelectedUser(sender button: UIButton) {
        let transform: CGAffineTransform
        if !isSelectedUser {
            transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
        }
        else {
            transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
        }
        
        isSelectedUser = !isSelectedUser
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
                        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }, completion: nil)
        
    }
    
    
    
//    @IBAction func buttonPressed(){
//        let animation = CABasicAnimation(keyPath: "position")
//        let randomPoint = CGPoint(x: Int.random(in: 1..<250), y: Int.random(in: 1..<250))
//        animation.duration = 1
//        animation.toValue = [randomPoint.x, randomPoint.y]
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = .both
//        animation.delegate = self
//        layer.add(animation, forKey: nil)
//    }
//
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        center = CGPoint(x: layer.position.x, y: layer.position.y)
//        frame = CGRect(x: center.x - 50, y: center.y - 50, width: 100, height: 100)
//        setTitle("XYI", for: .normal)
//    }
}
