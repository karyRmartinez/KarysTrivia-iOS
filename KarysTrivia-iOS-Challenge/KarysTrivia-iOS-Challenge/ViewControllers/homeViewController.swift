//
//  homeViewController.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/28/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setButtonConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(startButton)
    }
    
    private func setButtonConstraints() {
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            startButton.widthAnchor.constraint(equalToConstant: 130),
            startButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
 
}
