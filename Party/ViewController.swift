//
//  ViewController.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit
class ViewController: UIViewController {

    var friend: FriendButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friend = FriendButton(type: .custom)
        friend.setOptions(view: view, center: CGPoint(x: view.center.x, y: view.center.y))
        view.addSubview(friend)
    }
}

