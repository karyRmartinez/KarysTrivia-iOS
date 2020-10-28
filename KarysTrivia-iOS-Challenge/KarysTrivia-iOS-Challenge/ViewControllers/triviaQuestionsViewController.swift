//
//  triviaQuestionsViewController.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/28/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class triviaQuestionsViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let tqView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        tqView.register(questionsCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
        tqView.backgroundColor = .systemPink
        return tqView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
