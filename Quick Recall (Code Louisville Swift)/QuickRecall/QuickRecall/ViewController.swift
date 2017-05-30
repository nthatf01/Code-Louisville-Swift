//
//  ViewController.swift
//  QuickRecall
//
//  Created by Nathaniel Hatfield on 5/29/17.
//  Copyright © 2017 Nathaniel Hatfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton: UIButton!
    
    let questionProvider = QuestionProvider()
    var currentQuestion: Question = Question("", [""])
    var questionNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = questionProvider.randomQuestion()
        questionLabel.text = "Question \(questionNumber): \(currentQuestion.clue)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerQuestion(_ sender: UIButton) {
        
        currentQuestion = questionProvider.randomQuestion()
        questionNumber += 1
        questionLabel.text = "Question \(questionNumber): \(currentQuestion.clue)"
        
    }

}

