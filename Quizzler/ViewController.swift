//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions: QuestionBank = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // tags setup on the buttons. (see main.storyboard)
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            //questionLabel.text = allQuestions.list[questionNumber].questionText
            questionLabel.text = allQuestions.getQuestion(indexNum: questionNumber).getQuestionText()
        }
        else {
            
            let alert = UIAlertController(title: "End of Quiz. Dang...", message: "Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                //code after this action is pressed
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        // does the picked answer and the correct answer match
        //let correctAnswer = allQuestions.list[questionNumber].answer
        let correctAnswer = allQuestions.getQuestion(indexNum: questionNumber).getAnswer()
        
        if correctAnswer == pickedAnswer {
            print("You got it!")
        }
        else {
            print("wrong")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    
    func displayQuestion() {
        //let theQuestion = allQuestions.list[questionNumber]
       // questionLabel.text = allQuestions.getQuestion(indexNum: questionNumber).questionText
        //questionLabel.text = theQuestion.questionText
        questionLabel.text = allQuestions.getQuestion(indexNum: questionNumber).getQuestionText()
    }

    

    
}
