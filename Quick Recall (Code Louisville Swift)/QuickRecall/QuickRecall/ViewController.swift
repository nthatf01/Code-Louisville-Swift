//
//  ViewController.swift
//  QuickRecall
//
//  Created by Nathaniel Hatfield on 5/29/17.
//  Copyright © 2017 Nathaniel Hatfield. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var microphoneButton: UIButton!
  
    let questionProvider = QuestionProvider()
    var currentQuestion: Question = Question("", [""])
    var questionNumber: Int = 1
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentQuestion = questionProvider.randomQuestion()
        questionLabel.text = "Question \(questionNumber): \(currentQuestion.clue)"
        
        microphoneButton.isEnabled = false
        speechRecognizer.delegate = self
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            var isButtonEnabled = false
            
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            }
            
            OperationQueue.main.addOperation() {
                self.microphoneButton.isEnabled = isButtonEnabled
            }
        }
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
    
    @IBAction func microphoneTapped(_ sender: AnyObject) {
    
    }

}

