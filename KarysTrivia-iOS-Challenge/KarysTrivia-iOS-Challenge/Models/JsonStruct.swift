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
  
    public func AllPosibbleAnswers() -> [String] {
        var shuffleOptions = incorrect
        shuffleOptions.append(correct)
        return shuffleOptions.shuffled()
    }
    static func getUser(from data: Data) throws -> [triviaElement] {
          do {
              let trivia = try JSONDecoder().decode([triviaElement].self, from: data)
              return trivia
          } catch {
              throw JSONError.decodingError(error)
          }
          
      }

}
