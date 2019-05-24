//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Jake Stanger on 5/22/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    var listOfQuestions : Array<Question>
    
    init(someQuestion: Question) {
        self.listOfQuestions = Array()
        self.listOfQuestions.append(someQuestion)
    }
}
