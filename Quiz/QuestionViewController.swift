//
//  QuestionViewController.swift
//  Quiz
//
//  Created by student18 on 4/2/19.
//  Copyright © 2019 Uros Kalicanin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStuckView: UIStackView!
    @IBOutlet weak var multipleStuckView: UIStackView!
    @IBOutlet weak var rangedStuckView: UIStackView!
    
    
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous",
                           type: .rabbit),
                    Answer(text: "I barely notice them",
                           type: .turtle),
                    Answer(text: "I love them", type: .dog)
            ])
    ]
    var questionIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func updateUI() {
        singleStuckView.isHidden = true
        multipleStuckView.isHidden = true
        rangedStuckView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleStuckView.isHidden = false
        case .multiple:
            multipleStuckView.isHidden = false
        case .ranged:
            rangedStuckView.isHidden = false
            
            
        }
        
        
    }
    
}
