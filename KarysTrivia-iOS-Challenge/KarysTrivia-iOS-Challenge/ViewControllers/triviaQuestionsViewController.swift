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
     
  lazy var titleLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont(name: "Optima-BOld", size: 16)
    label.textAlignment = .center
    label.textColor = .black
    label.backgroundColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
       return label
         }()
    
    func addSubview() {
        view.addSubview(titleLabel)
     }
  
    func giveQuestion() {
        let tquestion = user[initialQuestion]
        titleLabel.text = tquestion.question
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
             titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
             titleLabel.widthAnchor.constraint(equalToConstant: 130),
             titleLabel.heightAnchor.constraint(equalToConstant: 35)
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
