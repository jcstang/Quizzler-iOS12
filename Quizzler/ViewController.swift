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
    //var pickedAnswer: Bool = false
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
        // pass user selection to checkAnswer method.
        if sender.tag == 1 {
            checkAnswer(answerSelected: true)
        }
        else if sender.tag == 2 {
            checkAnswer(answerSelected: false)
        }

        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if questionNumber < allQuestions.listSize {
            questionLabel.text = allQuestions.getQuestion(indexNum: questionNumber).getQuestionText()
        }
        else {
            
            let alert = UIAlertController(title: "Dang....End of Quiz.", message: "Do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                //code after this action is pressed
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer(answerSelected: Bool) {
        // does the picked answer and the correct answer match
        //let correctAnswer = allQuestions.list[questionNumber].answer
        let correctAnswer = allQuestions.getQuestion(indexNum: questionNumber).getAnswer()
        
        if correctAnswer == answerSelected {
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
        questionLabel.text = allQuestions.getQuestion(indexNum: questionNumber).getQuestionText()
    }

    

    
}
