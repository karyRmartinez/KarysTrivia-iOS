//
//  triviaQuestionsViewController.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/28/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class triviaQuestionsViewController: UIViewController {
    
    var user = [triviaElement]()
    var initialQuestion: Int = 0
     
  lazy var questionLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont(name: "Optima-BOld", size: 16)
    label.textAlignment = .center
    label.textColor = .black
    label.backgroundColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
       return label
         }()
    lazy var optionAButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 12
           return button
       }()
    lazy var optionBButton: UIButton = {
     let button = UIButton()
     button.backgroundColor = .systemBlue
     button.translatesAutoresizingMaskIntoConstraints = false
     button.layer.cornerRadius = 12
             return button
         }()
    lazy var optionCButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 12
            return button
         }()
    lazy var optionDButton: UIButton = {
             let button = UIButton()
             button.backgroundColor = .systemBlue
             button.translatesAutoresizingMaskIntoConstraints = false
             button.layer.cornerRadius = 12
             return button
         }()
    func addSubview() {
        view.addSubview(questionLabel)
        view.addSubview(optionAButton)
        view.addSubview(optionBButton)
        view.addSubview(optionCButton)
        view.addSubview(optionDButton)
     }
  
    func giveQuestion() {
        let tquestion = user[initialQuestion]
        questionLabel.text = tquestion.question
    }
    override func viewDidLoad() {
    view.backgroundColor = .white
         addSubview()
         setContraints()
        loadData()
        giveQuestion()
         super.viewDidLoad()
    }

    func setContraints() {
    NSLayoutConstraint.activate([
      questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
     questionLabel.widthAnchor.constraint(equalToConstant: 300),
     questionLabel.heightAnchor.constraint(equalToConstant: 35)
    
    
    ])
     }
    
    
    private func loadData () {
    guard let pathToData = Bundle.main.path(forResource: "Apprentice_TandemFor400_Data", ofType: "json") else {
            fatalError("Apprentice_TandemFor400_Data.json file not found")
                }

      let internalUrl = URL(fileURLWithPath: pathToData)
        do {
         let data = try Data(contentsOf: internalUrl)
         let userFromJSON = try triviaElement.getUser(from: data)
          user = userFromJSON
               }
               catch {
                   fatalError("An error occurred: \(error)")
               }

           }
}
