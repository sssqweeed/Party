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
    var mainNotice: CustomLabel!
    
    //var countPayers: UInt = 0
    
    var currentCondition: Conditions = .normal{
        didSet{
            if currentCondition == .normal {
                addFriendButton.isEnabled = true
                addExpenditureButton.isEnabled = true
                okButton.isHidden = true
                hideNotice(notice: mainNotice)
                
            }
            if currentCondition == .choosePayer {
                hideNotice(notice: mainNotice)
                addFriendButton.isEnabled = false
                addExpenditureButton.isEnabled = false
                showNotice(message: "choosePayer")
            }
            if currentCondition == .chooseFriends {
                hideNotice(notice: mainNotice)
                addFriendButton.isEnabled = false
                addExpenditureButton.isEnabled = false
                showNotice(message: "chooseFriends")
            }
        }
    }
    
    @IBOutlet var mainView: MainView!
    @IBOutlet weak var addFriendButton: CustomButton!
    @IBOutlet weak var addExpenditureButton: UIButton!
    @IBOutlet weak var meButton: FriendButton!
    @IBOutlet weak var okButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        meButton.parent = self
        friends.append(meButton)
        meButton.setOptions(view: mainView, viewController: self, center: CGPoint(), name: "", its: .me)
        visualEffectView = BlureView(effect: nil, to: mainView)
        mainView.addSubview(visualEffectView)
        
        mainNotice = CustomLabel(frame: CGRect(x: mainView.bounds.width * (1/4), y: -100, width: mainView.bounds.width * (2/4), height: 50))
        mainNotice.textAlignment = .center
        mainView.addSubview(mainNotice)
        
        // test code
        let friend1 = FriendButton()
        friend1.setOptions(view: mainView, viewController: self, center: CGPoint(x: 100, y: 150), name: "Misha", its: .friend)
        mainView.insertSubview(friend1, at: 1)
        let friend2 = FriendButton()
        friend2.setOptions(view: mainView, viewController: self, center: CGPoint(x: 100, y: 300), name: "Sasha", its: .friend)
        mainView.insertSubview(friend2, at: 1)
        
        friends.append(friend1)
        friends.append(friend2)
        //----------
    }
    
    @IBAction func addFriend(_ sender: UIButton) {
        showEnterField(textButton: "Save new friend", target: .addFriend)
    }
    
    @IBAction func addExpenditure(_ sender: UIButton) {
        showEnterField(textButton: "Add expenditure", target: .addExpenditure)
    }
    
    @IBAction func confirm(_ sender: CustomButton) {
        switch currentCondition {
        case .choosePayer:
            currentCondition = .chooseFriends
            for friend in friends {
                if let safeFriend = friend {
                    if safeFriend.condition == .payer {
                        safeFriend.isEnabled = false
                    }
                }
            }
        case .chooseFriends:
            currentCondition = .normal
            for friend in friends {
                if let safeFriend = friend {
                    safeFriend.switchToDefaultState()
                }
            }
        
        default:
            let x = 0
            
            //todo
        }
    }
    private func showEnterField(textButton: String, target: Targets){
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 1
        })
        
        enterView = CustomUIView(frame: CGRect(x: mainView.bounds.width * (1/8), y: mainView.bounds.height*(1/4), width: mainView.bounds.width*(3/4), height: mainView.bounds.height*(1/4)))
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
        buttonCancel = CustomButton(frame: CGRect(x: mainView.bounds.width * (7/8) - 35, y: mainView.bounds.height*(1/4) - 15, width: 50, height: 50))
        buttonCancel.setImage(UIImage.init(imageLiteralResourceName: "delete.png"), for: .normal)
        buttonCancel.addTarget(self, action: #selector(removeEnterField), for: .touchUpInside)
        
        
        mainView.addSubview(enterView)
        mainView.addSubview(buttonCancel)
        
    }
    
    @IBAction private func endOfAddingFriend() {
        if let name = textField.text {
            if name != "" {
                let newFried = FriendButton(type: .custom)
                newFried.setOptions(view: mainView, viewController: self, center: CGPoint(x: Int.random(in: 1..<500), y: Int.random(in: 1..<500)), name: name, its: .friend)
                newFried.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
                friends.append(newFried)
                mainView.insertSubview(newFried, at: 1)
                UIView.animate(withDuration: 0.5,
                               delay: 0.3,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 3,
                               options: [.curveEaseInOut],
                               animations: {
                                newFried.transform = CGAffineTransform.identity
                               },
                               completion: nil)
                
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
        currentCondition = .choosePayer
        removeEnterField()
    }
    @IBAction private func removeEnterField(){
        enterView.removeFromSuperview()
        buttonCancel.removeFromSuperview()
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.alpha = 0
        })
    }
    
    private func showNotice(message: String) {
        mainNotice.text = message
        mainNotice.move(to: CGPoint(x: mainView.bounds.width * (1/2), y: +70))
    }
    
    private func hideNotice(notice: CustomLabel) {
        notice.move(to: CGPoint(x: mainView.bounds.width * (1/2), y: -100))
    }
    
    func checkFriends() {
        if currentCondition == .choosePayer{
            if alreadySelected(with: .payer) > 0 {
                okButton.isHidden = false
            }
            else {
                okButton.isHidden = true
            }
        }
//        if currentCondition == .chooseFriends{
//            for friend in friends {
//                if let safeFriend = friend {
//                    if safeFriend.condition == .someone { //todo...
//
//                        safeFriend.condition = .borrower
//                        safeFriend.backgroundColor = .red
//                        safeFriend.isEnabled = false
//                        break
//
//                    }
//                }
//            }
//        }
    }
    
    func alreadySelected(with property: Select) -> Int {
        var count = 0
        for friend in friends {
            if friend?.condition == property {
                count += 1
            }
        }
        return count
    }
    
}

enum Targets {
    case addFriend, addExpenditure
}

enum Conditions {
    case normal, choosePayer, chooseFriends
}

class BlureView: UIVisualEffectView {
    
    init(effect: UIVisualEffect?, to mainView: UIView) {
        super.init(effect: effect)
        self.frame = mainView.frame
        self.alpha = 0
        self.effect = UIBlurEffect(style: .dark)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


