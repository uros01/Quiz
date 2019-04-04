//
//  QuestionViewController.swift
//  Quiz
//
//  Created by student18 on 4/2/19.
//  Copyright © 2019 Uros Kalicanin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
   @IBOutlet weak var questionLabel: UILabel!
    
    //Button//
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
         // Label//
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multilLabel4: UILabel!
    
            //SwitchButtons//
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    
            // Ranged//
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
            //rangedSlider//
    @IBOutlet weak var rangedSlider: UISlider!
    
    
            //UIProgress//
    @IBOutlet weak var questionProgressView: UIProgressView!
    
 
    
    
    
    
    
    
       
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
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true )
        
        
        switch currentQuestion.type {
        case .single:
        updateSingleStack(using: currentAnswers)
        case .multiple:
        updateMultipleStack(using: currentAnswers)
        case .ranged:
        updateRagedStack(using: currentAnswers)
            
            
        }
   }
        //updatesingleQuestion//
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
        //update multiple Qestion//
    func updateMultipleStack(using answers:[Answer]) {
        multipleStackView.isHidden = false
        
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel1.text = answers[3].text
        }
    
        //updateRangedQuestion//
    func updateRagedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
}
        //singlequestion//
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let cuirrntAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
        answersChosen.append(cuirrntAnswers[0])
        case singleButton2:
        answersChosen.append(cuirrntAnswers[1])
        case singleButton3:
        answersChosen.append(cuirrntAnswers[2])
        case singleButton4:
        answersChosen.append(cuirrntAnswers[3])
        default:
        break
        }
       nextQuestion()
}
    
    
    
           //muliquestion//
    @IBAction func multipleAnswerButtonPressed() {
        
    let cuirrntAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn {
            answersChosen.append(cuirrntAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(cuirrntAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(cuirrntAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(cuirrntAnswers[3])
        }
        nextQuestion()
  }
          //rangedanswerButtonPressed Submit//
    @IBAction func rangedAnswerButtonPressed() {
        
    let currentAnswers = questions[questionIndex].answers
        
    let index = Int(round(rangedSlider.value *
            Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion() {
    questionIndex += 1
    
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responses = answersChosen
        }
        
    
    
 }
}
