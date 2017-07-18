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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var correctOrIncorrectLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let questionProvider = QuestionProvider()
    var currentQuestion: Question = Question("", [""])
    var questionNumber: Int = 1
    var playerAnswer = ""
    var countdownTimer: Timer!
    var totalTime = 3
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
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
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            microphoneButton.isEnabled = false
            microphoneButton.setTitle("Start Recording", for: .normal)
            endTimer()
        } else {
            startRecording()
            microphoneButton.setTitle("Stop Recording", for: .normal)
            startTimer()
        }
    }
    
    func startRecording() {
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil {
                
                self.textView.text = result?.bestTranscription.formattedString
                self.playerAnswer = self.textView.text
                isFinal = (result?.isFinal)!
                
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        textView.text = "Please speak your answer!"
        
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }
    
    func startTimer() {
        if timerLabel.isHidden == true {
            timerLabel.isHidden = false
        }
        if textView.isHidden == true {
            textView.isHidden = false
        }
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        totalTime = 3
        audioEngine.stop()
        recognitionRequest?.endAudio()
        microphoneButton.isEnabled = false
        microphoneButton.setTitle("BUZZ", for: .normal)
        if correctOrIncorrectLabel.isHidden == true {
            correctOrIncorrectLabel.isHidden = false
        }
        switch self.currentQuestion.checkAnswer(for: self.playerAnswer) {
            case true: self.correctOrIncorrectLabel.text = "Correct!"
            case false:self.correctOrIncorrectLabel.text = "Incorrect"
        }
        updateQuestion()
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        //let minutes: Int = (totalSeconds / 60) % 60
        //let hours: Int = totalSeconds / 3600
        return String(format: "%02d", seconds)
    }
    
    func updateQuestion() {
        currentQuestion = questionProvider.randomQuestion()
        questionNumber += 1
        questionLabel.text = "Question \(questionNumber): \(currentQuestion.clue)"
        
    }
    
    @IBAction func startPractice(_ sender: Any) {
        if microphoneButton.isHidden == true {
            microphoneButton.isHidden = false
        }
        if questionLabel.isHidden == true {
            questionLabel.isHidden = false
        }
        if startButton.isHidden == false {
            startButton.isHidden = true
        }
        
        let speechUtterance = AVSpeechUtterance(string: questionLabel.text!)
        
        speechSynthesizer.speak(speechUtterance)
        
    }
    
}

