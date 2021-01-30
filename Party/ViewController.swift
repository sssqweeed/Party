//
//  ViewController.swift
//  Party
//
//  Created by Михаил Воронин on 28.01.2021.
//

import UIKit
class ViewController: UIViewController {

    var friends: [FriendButton?] = []
    var visualEffectView: UIVisualEffectView!
    
    var enterView: CustomUIView!
    var nameTextField: CustomUITextField!
    var buttonSave: CustomButton!
    
    @IBOutlet weak var addNewFriendButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visualEffectView = BlureView(effect: nil, to: view)
        view.addSubview(visualEffectView)
        
        addNewFriendButton.addTarget(self, action: #selector(addNewFriend), for: .touchUpInside)
    }
    
    @IBAction private func addNewFriend(){
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 1
        })
        
        enterView = CustomUIView(frame: CGRect(x: view.bounds.width * (1/8), y: view.bounds.height*(1/4), width: view.bounds.width*(3/4), height: view.bounds.height*(1/4)))
        enterView.backgroundColor = .white
        nameTextField = CustomUITextField(frame: CGRect(x: enterView.bounds.width * (1/8), y: enterView.bounds.height * (1/8), width: enterView.bounds.width * (6/8), height: 50))
        
        nameTextField.backgroundColor = .white
        enterView.addSubview(nameTextField)
        
        buttonSave = CustomButton(frame: CGRect(x: enterView.bounds.width * (1/8), y: enterView.bounds.height * (5/8), width: enterView.bounds.width * (6/8), height: 50))
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.setTitleColor(.black, for: .normal)
        buttonSave.addTarget(self, action: #selector(endOfAddingFriend), for: .touchUpInside)
        
        enterView.addSubview(buttonSave)
        view.addSubview(enterView)
    }
    
    @IBAction private func endOfAddingFriend(basicView: CustomUIView) {
        if let name = nameTextField.text {
            let newFried = FriendButton(type: .custom)
            newFried.setOptions(view: view, center: CGPoint(x: Int.random(in: 1..<500), y: Int.random(in: 1..<500)), name: name)
            friends.append(newFried)
            view.insertSubview(newFried, at: 1)
            
        }
        else {
            // todo...
        }
        
        enterView.removeFromSuperview()
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 0
        })
    }
}

class BlureView: UIVisualEffectView {
    
    init(effect: UIVisualEffect?, to view: UIView) {
        super.init(effect: effect)
        self.frame = view.frame
        self.alpha = 0
        self.effect = UIBlurEffect(style: .dark)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
