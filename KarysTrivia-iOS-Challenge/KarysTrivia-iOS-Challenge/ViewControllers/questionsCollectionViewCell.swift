//
//  questionsCollectionViewCell.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/28/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class questionsCollectionViewCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "Optima-BOld", size: 16)
            //label.textAlignment = .center
          label.textColor = .black
          label.backgroundColor = .white
        
           
            return label
        }()
    
         private func setTitleConstraint() {
             titleLabel.translatesAutoresizingMaskIntoConstraints = false
             titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
             titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
             titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

         }
       private func addSubviews() {
           self.contentView.addSubview(titleLabel)
           
           
       }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubviews()
        setTitleConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)not impletented")
    }
}
