//
//  ViewController.swift
//  Quiz
//
//  Created by Tadmin on 6/13/17.
//  Copyright © 2017 Tadmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
    "What is 7+7",
    "What is capital of Vermont",
    "What is cognac made from?"

    ]
    
    let answers: [String] = [
    "14",
    "Montepelier",
    "Grapes"
    
    ]
    var currentQuestionIndex: Int = 0;
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func showNextQuestion (_ send: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
                currentQuestionIndex = 0
            
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        
    
    }
    @IBAction func showAnswer(_ send: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
        
    }

}

