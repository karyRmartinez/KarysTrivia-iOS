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
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.text = "Tandem Trvia"
        label.font = UIFont(name: "savoyeLetPlain", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setButtonConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(startButton)
        self.view.addSubview(titleLabel)
    }
    
    private func setButtonConstraints() {
    NSLayoutConstraint.activate([
    startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
    startButton.widthAnchor.constraint(equalToConstant: 130),
    startButton.heightAnchor.constraint(equalToConstant: 35),
            
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  
        ])
    }
 
}
