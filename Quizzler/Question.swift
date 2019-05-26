//
//  Question.swift
//  Quizzler
//
//  Created by Jake Stanger on 5/22/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    private let questionText : String
    private let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
    func getQuestionText() -> String {
        return self.questionText
    }
    
    func getAnswer() -> Bool {
        return self.answer
    }
    
}
