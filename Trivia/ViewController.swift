//
//  ViewController.swift
//  Trivia
//
//  Created by Brandon Lopez on 6/24/25.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var QuesionCounter: UILabel!
    @IBOutlet weak var QuestionBox: UIView!
    @IBOutlet weak var QuestionText: UILabel!
    
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    var questions: [Question] = [
        Question(
            text: "Which champion is known as \"The Blind Monk\"?",
            answers: ["Lee Sin", "Yasuo", "Master Yi", "Riven"],
            correctAnswerIndex: 0
        ),
        Question(
            text: "What is the name of the large monster in the river that grants a team-wide buff when killed?",
            answers: ["Baron Nashor", "Dragon", "Rift Herald", "Elder Dragon"],
            correctAnswerIndex: 0
        ),
        Question(
            text: "Which item provides the unique passive \"Spellblade,\" enhancing your next basic attack after using an ability?",
            answers: ["Trinity Force", "Infinity Edge", "Luden’s Tempest", "Black Cleaver"],
            correctAnswerIndex: 0
        )
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()  // Show the first question when the view loads
    }
    
    // Function to update the UI with the current question and answers
    func showQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        QuesionCounter.text = "Question: \(currentQuestionIndex + 1)/\(questions.count)"
        QuestionText.text = currentQuestion.text
        
        Answer1.setTitle(currentQuestion.answers[0], for: .normal)
        Answer2.setTitle(currentQuestion.answers[1], for: .normal)
        Answer3.setTitle(currentQuestion.answers[2], for: .normal)
        Answer4.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    // Action connected to all four buttons
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        
        guard let buttonIndex = [Answer1, Answer2, Answer3, Answer4].firstIndex(of: sender) else { return }
        
        if buttonIndex == currentQuestion.correctAnswerIndex {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            showQuestion()
        } else {
            QuestionText.text = "Quiz Complete!"
            QuesionCounter.text = ""
            
            // Disable buttons after quiz ends
            Answer1.isEnabled = false
            Answer2.isEnabled = false
            Answer3.isEnabled = false
            Answer4.isEnabled = false
        }
    }
}
