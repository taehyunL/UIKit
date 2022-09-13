//
//  ViewController.swift
//  Hangman
//
//  Created by 이태현 on 2022/09/08.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = .white
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ANSWER"
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = .red
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

