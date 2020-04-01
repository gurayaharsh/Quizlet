

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let correct = quiz.checkAnswer(userAnswer)
        
        if correct {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quiz.changeQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz.getNextQuestion()
        scoreLabel.text = "Score: \(quiz.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quiz.getProgress()
    }
}

