//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizz = Quizz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    

    @IBAction func Aswered(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        if quizz.isCorrectAnswer(answer: userAnswer!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizz.nextQuestion()

        var timer: Timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = quizz.getScore()
        questionLabel.text = quizz.getQuestionText()
        progressBar.progress = quizz.getQuestionProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

