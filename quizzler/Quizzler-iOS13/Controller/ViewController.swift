//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var score: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        updateUI()
        progressbar.progress = 0.0
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer)
//        if result  {
//            quizBrain.questionNumber +=1
//        }else{
//            quizBrain.questionNumber = 0
//        }
        
        if result {
            sender.backgroundColor = UIColor.green
        }else
        {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        firstChoiceButton.setTitle(quizBrain.getAnswerChoice(0), for: .normal)
        secondChoiceButton.setTitle(quizBrain.getAnswerChoice(1), for: .normal)
        thirdChoiceButton.setTitle(quizBrain.getAnswerChoice(2), for: .normal)
        questionLabel.text = quizBrain.getQuestionText()
        progressbar.progress = quizBrain.getProgress()
        score.text = "Score: \(quizBrain.getScore())"
        firstChoiceButton.backgroundColor=UIColor.clear
        secondChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
        
        
        
    }
}
