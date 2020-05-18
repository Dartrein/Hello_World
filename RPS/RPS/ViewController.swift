//
//  ViewController.swift
//  RPS
//
//  Created by Dartrein on 01.05.2020.
//  Copyright © 2020 Dartrein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorceButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        //        statusLabel.text = "Hello"
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorceButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorceButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorceButton.isHidden = false
        }
        
        resetButton.isHidden = false

        let result = sign.getResult(computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose"
            self.view.backgroundColor = UIColor.red
        case .start:
//            print("this will never happen!")
reset()
        case .draw:
           statusLabel.text = "It's a draw"
           self.view.backgroundColor = UIColor.gray
        }
    }
    
    func reset() {
        statusLabel.text = "Rock, Paper, Scissors"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorceButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true

        
    }
    
    //MARK: - IBAction
    
    
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func scissorceButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    
    
}

