//
//  FriendButton.swift
//  testDynObj
//
//  Created by Михаил Воронин on 27.01.2021.
//

import UIKit
class FriendButton: UIButton, CAAnimationDelegate {
    
    var condition = Select.none {
        didSet{
            parent.checkFriends()
            
            
        }
    }
    private var nameFriend: String = ""
    
    var money: Double = 0 {
        didSet{
            setTitle("\(nameFriend)\n\(money)", for: .normal)
        }
    }
    
    var parent: ViewController! = nil // parent не может быть nil никогда после инициализации
    
    // todo...
    var its: WhoIs = .friend
    
    func move(to point: CGPoint) {
        UIView.animate(withDuration: 1, animations:{
            self.center = point
        })
    }
    
    func setOptions(view: UIView,viewController: ViewController, center: CGPoint, name: String, its: WhoIs) {
        self.its = its
        if its == .friend {
            bounds = view.bounds
            self.center = center
            frame = CGRect(x: center.x - 50, y: center.y - 50, width: 100, height: 100)
            layer.cornerRadius = frame.height / 2
            layer.masksToBounds = true
            
            titleLabel?.numberOfLines = 2
            
            nameFriend = name

            setTitle("\(name)\n\(money)", for: .normal)
            
            backgroundColor = #colorLiteral(red: 0.6929730773, green: 0.5930851698, blue: 0.4759702086, alpha: 1)
            contentHorizontalAlignment = .center
            layer.borderWidth = 5
            layer.borderColor = #colorLiteral(red: 0.6929730773, green: 0.5930851698, blue: 0.4759702086, alpha: 1)
        }
        else {
            //todo...
            // настроить по нажатию увеличение
        }
        
        isEnabled = false
        addTarget(self, action: #selector(animateSelectedUser), for: [.touchDown, .touchDragEnter])
        parent = viewController
    }
    
    @IBAction private func animateSelectedUser(sender button: FriendButton) {
        
        
        if parent.alreadySelected(with: .payer) == 1 && button.condition != .payer && parent.currentCondition == .choosePayer{
            return
        }
        
        let transform: CGAffineTransform
        let borderColor: UIColor
        let defaultColor = #colorLiteral(red: 0.6929730773, green: 0.5930851698, blue: 0.4759702086, alpha: 1)
        let changeColor: UIColor
        
        switch parent.currentCondition {
        case .chooseFriends:
            borderColor = .red
        case .choosePayer:
            borderColor = .green
        default:
            borderColor = .clear
        }
        
        if condition == .none {
            transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
            switch parent.currentCondition {
            case .chooseFriends:
                condition = .borrower
            case .choosePayer:
                condition = .payer
            default:
                condition = .someone
            }
            changeColor = borderColor
        }
        else {
            transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            condition = .none
            changeColor = defaultColor
        }
        
        if self.its == .friend {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            button.transform = transform
                            button.layer.borderColor = changeColor.cgColor
                            //button.backgroundColor = changeColor
                }, completion: nil)
        }
    }
    
    func switchToDefaultState() {
        let transform = CGAffineTransform.identity
        let defaultColor = #colorLiteral(red: 0.6929730773, green: 0.5930851698, blue: 0.4759702086, alpha: 1).cgColor
        self.isEnabled = false
        self.condition = .none
        if self.its == .friend {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            self.transform = transform
                            self.layer.borderColor = defaultColor
                            //button.backgroundColor = changeColor
                }, completion: nil)
        }
        else {
            // todo
        }
    }
}

enum WhoIs {
    case friend, me
}

enum Select{
    case none, payer, borrower, someone
}
