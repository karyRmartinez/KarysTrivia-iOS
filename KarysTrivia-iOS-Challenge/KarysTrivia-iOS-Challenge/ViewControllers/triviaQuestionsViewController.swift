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
    var selectedAnswer: Int = 0
    var score = 0
    var scoreIncrement = ""
    var optionbuttons = [UIButton]()
     
  lazy var questionLabel: UILabel = {
     let label = UILabel()
         label.font = UIFont(name: "Optima-BOld", size: 16)
         label.textAlignment = .center
         label.textColor = .black
         label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
         }()
    lazy var scoreLabel: UILabel = {
    let label = UILabel()
        label.text = "0/0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var optionAButton: UIButton = {
    let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
    button.layer.cornerRadius = 12
           return button
       }()
    lazy var optionBButton: UIButton = {
     let button = UIButton()
     button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
     button.layer.cornerRadius = 12
             return button
         }()
    lazy var optionCButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
    button.layer.cornerRadius = 12
            return button
         }()
    lazy var optionDButton: UIButton = {
             let button = UIButton()
             button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
             button.layer.cornerRadius = 12
             return button
         }()
    func addSubview() {
        view.addSubview(questionLabel)
        view.addSubview(scoreLabel)
        view.addSubview(stackView)

     }
  
    func questionsAndAnswers() {
        let tquestion = user[initialQuestion]
        questionLabel.text = tquestion.question
      
        let shuffledQ = tquestion.AllPosibbleAnswers()
       optionbuttons = [optionAButton, optionBButton, optionCButton, optionDButton]
        optionbuttons.forEach{$0.isHidden = true}
        for (index, answer) in shuffledQ.enumerated() {
                  optionbuttons[index].isHidden = false
                  optionbuttons[index].setTitle(answer, for: .normal)
              }
    }
   

    private lazy var stackView: UIStackView = {
         let stackView = UIStackView(
             arrangedSubviews: [
                 optionAButton,
                 optionBButton,
                 optionCButton,
                 optionDButton
             ]
         )
         stackView.axis = .vertical
         stackView.spacing = 15
         stackView.distribution = .fillEqually
         return stackView
     }()
    override func viewDidLoad() {
    view.backgroundColor = .white
         addSubview()
        setContraints()
        setupStackViewConstraints()
        loadData()
        questionsAndAnswers()
         super.viewDidLoad()
    }

    func setContraints() {
    NSLayoutConstraint.activate([
      questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
     questionLabel.widthAnchor.constraint(equalToConstant: 300),
     questionLabel.heightAnchor.constraint(equalToConstant: 35),
     
     scoreLabel.heightAnchor.constraint(equalToConstant: 20),
     scoreLabel.widthAnchor.constraint(equalToConstant: 150),
     scoreLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70),
     scoreLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80)
    
    ])
     }
    private func setupStackViewConstraints() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
    stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
    stackView.heightAnchor.constraint(equalToConstant: 250)
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
