//
//  triviaQuestionsViewController.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/28/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class TriviaQuestionsViewController: UIViewController {
    
    var allTrivia = [TriviaElement]()
    var currentQuestion: Int = 0 {
        didSet {
            gotoQuestion(questionNumber: currentQuestion)
            print(currentQuestion)
        }
    }
    var selectedAnswer: Int = 0
    var score = 0
    var optionbuttons = [UIButton]()
    
     
  lazy var questionLabel: UILabel = {
     let label = UILabel()
         label.font = UIFont(name: "Optima-BOld", size: 17)
         label.textAlignment = .center
         label.textColor = .black
    label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
         }()
    lazy var screenLabel: UILabel = {
       let label = UILabel()
           label.font = UIFont(name: "Optima-BOld", size: 17)
           label.textAlignment = .center
           label.textColor = .black
           label.backgroundColor = .white
          label.translatesAutoresizingMaskIntoConstraints = false
         return label
           }()
    lazy var scoreLabel: UILabel = {
    let label = UILabel()
        label.text = "0/0 "
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var queNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0/0"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var optionAButton: UIButton = {
    let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
        button.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
    button.layer.cornerRadius = 12
           return button
       }()
    lazy var optionBButton: UIButton = {
     let button = UIButton()
     button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
     button.layer.cornerRadius = 12
          button.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
             return button
         }()
    lazy var optionCButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
    button.layer.cornerRadius = 12
          button.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
            return button
         }()
    lazy var optionDButton: UIButton = {
             let button = UIButton()
             button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.3341596554)
             button.layer.cornerRadius = 12
          button.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
             return button
         }()
  private func addSubview() {
        view.addSubview(questionLabel)
        view.addSubview(scoreLabel)
        view.addSubview(scoreLabel)
        view.addSubview(queNumberLabel)
        view.addSubview(stackView)

     }
  
    private func gotoQuestion(questionNumber: Int )  {
        let triviaElement = allTrivia[questionNumber]
        questionLabel.text = triviaElement.question
        scoreLabel.text = "score: \(score)"
    
      
        let shuffledAnswers = triviaElement.shuffledAnswers()
            
       optionbuttons = [optionAButton, optionBButton, optionCButton, optionDButton]

        for (index, answer) in shuffledAnswers.enumerated() {
                  optionbuttons[index].setTitle(answer, for: .normal)
              }

    }

    @objc func answerButtonPressed(sender: UIButton) {
        let triviaQuestion = allTrivia[currentQuestion]
        if sender.titleLabel?.text == triviaQuestion.correct {
            self.view.backgroundColor = .green
            self.score += 1
           
        }
         else {
            self.view.backgroundColor = .red
        }
        if currentQuestion + 1 >= allTrivia.count {
            print("next question index is out of range")
        }else {
            self.currentQuestion += 1
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
        gotoQuestion(questionNumber: 0)
         super.viewDidLoad()
        print("all trivia count is\(allTrivia.count)")
    }
    
    private func loadData () {
    guard let pathToData = Bundle.main.path(forResource: "Apprentice_TandemFor400_Data", ofType: "json") else {
            fatalError("Apprentice_TandemFor400_Data.json file not found")
                }

      let internalUrl = URL(fileURLWithPath: pathToData)
        do {
         let data = try Data(contentsOf: internalUrl)
         let allTrivia = try TriviaElement.getTrivia(from: data)
            self.allTrivia = Array(allTrivia.shuffled().prefix(10))
               }
               catch {
                   fatalError("An error occurred: \(error)")
               }

           }

    func setContraints() {
    NSLayoutConstraint.activate([
      questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
     questionLabel.widthAnchor.constraint(equalToConstant: 300),
     questionLabel.heightAnchor.constraint(equalToConstant: 35),
     
     scoreLabel.heightAnchor.constraint(equalToConstant: 20),
     scoreLabel.widthAnchor.constraint(equalToConstant: 150),
     scoreLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
     scoreLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
    
     queNumberLabel.heightAnchor.constraint(equalToConstant: 20),
    queNumberLabel.widthAnchor.constraint(equalToConstant: 150),
    queNumberLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
    queNumberLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80)
    
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
    

}
