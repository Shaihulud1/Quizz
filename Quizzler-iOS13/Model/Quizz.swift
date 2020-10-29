//
//  Quizz.swift
//  Quizzler-iOS13
//
//  Created by Илья Дернов on 29.10.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Quizz {
    let questions = [
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var qNumb = 0
    var score = 0
    
    mutating func isCorrectAnswer(answer: String) -> Bool {
        if answer == questions[qNumb].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() -> Void {
        if qNumb + 1 < questions.count {
            qNumb += 1
        } else {
            score = 0
            qNumb = 0
        }
    }
    
    func getQuestionProgress() -> Float {
        let oneQuestionPrice = 100 / questions.count
        return (Float(oneQuestionPrice) * Float(qNumb)) / 100
    }
    
    func getQuestionText() -> String {
        return questions[qNumb].question
    }
    
    func getScore() -> String{
        return "\(score) of \(questions.count)"
    }
    
}
