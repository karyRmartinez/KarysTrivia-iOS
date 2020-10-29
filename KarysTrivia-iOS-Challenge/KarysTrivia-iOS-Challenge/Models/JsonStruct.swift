//
//  JsonStruct.swift
//  KarysTrivia-iOS-Challenge
//
//  Created by Kary Martinez on 10/27/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct triviaElement: Codable {
    let question: String
    let incorrect: [String]
    let correct: String
   
    

}
