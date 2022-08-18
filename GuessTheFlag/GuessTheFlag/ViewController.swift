//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by 이태현 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var buttonTapCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        navigationController?.navigationBar.topItem?.title = countries[correctAnswer].uppercased()
        title = "\(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        buttonTapCount += 1

        if buttonTapCount == 10 {
            score = 0
            buttonTapCount = 0
            title = "final"
            let ac = UIAlertController(title: title, message: "finale score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue?", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
            } else {
                title = "Wrong! That's the flag of \(countries[sender.tag])"
                score -= 1
            }
            let ac = UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue?", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }

    }
    
}

