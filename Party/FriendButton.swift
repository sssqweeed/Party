//
//  FriendButton.swift
//  testDynObj
//
//  Created by Михаил Воронин on 27.01.2021.
//

import UIKit
class FriendButton: UIButton, CAAnimationDelegate {


    private var isSelectedUser = false
    
    func move(to point: CGPoint) {
        UIView.animate(withDuration: 1, animations:{
            self.center = point
        })
    }
    
    func setOptions(view: UIView, center: CGPoint) {
        bounds = view.bounds
        self.center = center
        frame = CGRect(x: center.x - 50, y: center.y - 50, width: 100, height: 100)
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        titleLabel?.numberOfLines = 2
        setTitle("Feriend\nLOL", for: .normal)
        
        
        addTarget(self, action: #selector(animateSelectedUser), for: [.touchDown, .touchDragEnter])
        
    }
    
    @IBAction private func animateSelectedUser(sender button: UIButton) {
        let transform: CGAffineTransform
        let colorChange: UIColor
        if !isSelectedUser {
            transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
            colorChange = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
        else {
            transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            colorChange = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        isSelectedUser = !isSelectedUser
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
                        button.backgroundColor = colorChange
            }, completion: nil)
        
    }
    
}
