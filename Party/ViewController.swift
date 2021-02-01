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
    var textField: CustomUITextField!
    var buttonSave: CustomButton!
    var buttonCancel: CustomButton!
    var expenditure: Optional<Double> = nil
    
    @IBOutlet weak var addFriendButton: CustomButton!
    @IBOutlet weak var addExpenditureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visualEffectView = BlureView(effect: nil, to: view)
        view.addSubview(visualEffectView)
        
        //addFriendButton.addTarget(self, action: #selector(showEnterField), for: .touchUpInside)
    }
    
    @IBAction func addFriend(_ sender: UIButton) {
        showEnterField(textButton: "Save", target: .addFriend)
    }
    
    @IBAction func addExpenditure(_ sender: UIButton) {
        showEnterField(textButton: "Add", target: .addExpenditure)
    }
    
    private func showEnterField(textButton: String, target: Targets){
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 1
        })
        
        enterView = CustomUIView(frame: CGRect(x: view.bounds.width * (1/8), y: view.bounds.height*(1/4), width: view.bounds.width*(3/4), height: view.bounds.height*(1/4)))
        enterView.backgroundColor = .white
        
        // text field
        textField = CustomUITextField(frame: CGRect(x: enterView.bounds.width * (1/8), y: enterView.bounds.height * (1/8), width: enterView.bounds.width * (6/8), height: 50))
        
        textField.backgroundColor = .white
        enterView.addSubview(textField)
        
        // button save
        buttonSave = CustomButton(frame: CGRect(x: enterView.bounds.width * (1/8), y: enterView.bounds.height * (5/8), width: enterView.bounds.width * (6/8), height: 50))
        buttonSave.setTitle(textButton, for: .normal)
        buttonSave.setTitleColor(.black, for: .normal)
        
        if target == .addFriend {
            buttonSave.addTarget(self, action: #selector(endOfAddingFriend), for: .touchUpInside)
        }
        else { //target == .addExpenditure
            buttonSave.addTarget(self, action: #selector(endOfAddingExpenditure), for: .touchUpInside)
        }
        enterView.addSubview(buttonSave)
        
        // button cancel
        buttonCancel = CustomButton(frame: CGRect(x: view.bounds.width * (7/8) - 35, y: view.bounds.height*(1/4) - 15, width: 50, height: 50))
        buttonCancel.setImage(UIImage.init(imageLiteralResourceName: "delete.png"), for: .normal)
        buttonCancel.addTarget(self, action: #selector(removeEnterField), for: .touchUpInside)
        
        
        view.addSubview(enterView)
        view.addSubview(buttonCancel)
        
    }
    
    @IBAction private func endOfAddingFriend() {
        if let name = textField.text {
            if name != "" {
                let newFried = FriendButton(type: .custom)
                newFried.setOptions(view: view, center: CGPoint(x: Int.random(in: 1..<500), y: Int.random(in: 1..<500)), name: name)
                friends.append(newFried)
                view.insertSubview(newFried, at: 1)
            }
            else {
                //todo...
            }
        }
        else {
            // todo...
        }
        removeEnterField()
    }
    
    @IBAction private func endOfAddingExpenditure(){
        expenditure = Double(textField.text!)
        for friend in friends {
            friend?.isEnabled = true
        }
        // сделать уведомдение и кнопку
        removeEnterField()
    }
    @IBAction private func removeEnterField(){
        enterView.removeFromSuperview()
        buttonCancel.removeFromSuperview()
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 0
        })
    }
}

enum Targets {
    case addFriend, addExpenditure
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
