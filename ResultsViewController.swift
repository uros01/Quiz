//
//  ResultsViewController.swift
//  Quiz
//
//  Created by student18 on 4/2/19.
//  Copyright © 2019 Uros Kalicanin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        
    }
    
    func calculatePersonalityResult() {
    var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map{ $0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        }
    let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
            { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        })
         
    let mostCommonAnswer = frequentAnswersSorted.first!.key
        
    resultAnswerLabel.text = "You are a\(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.defenition
    
    }
    
    
    //end of class//
}
