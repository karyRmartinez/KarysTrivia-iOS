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

struct TriviaElement: Codable {
    let question: String
    let incorrect: [String]
    let correct: String
  
   func shuffledAnswers() -> [String] {
        var shuffleOptions = incorrect
        shuffleOptions.append(correct)
        return shuffleOptions.shuffled()
    }
    
    static func getTrivia(from data: Data) throws -> [TriviaElement] {
          do {
              let trivia = try JSONDecoder().decode([TriviaElement].self, from: data)
              return trivia
          } catch {
              throw JSONError.decodingError(error)
          }
          
      }

}
