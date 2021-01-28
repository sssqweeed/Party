//
//  ViewController.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        freind = FriendButton(type: .custom)
        freind.setOptions(view: view, center: CGPoint(x: view.center.x, y: view.center.y))
        view.addSubview(freind)
        
        UIView.animate(withDuration: 1, animations: {
                        self.freind.center = CGPoint(x: 50, y: 50)
            
        })
    }


}

