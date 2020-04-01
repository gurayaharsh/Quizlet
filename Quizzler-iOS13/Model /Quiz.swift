
import Foundation

struct Quiz{
    let questionBank = [ Question(t: "A slug's blood is green.", a: "True"),
                       Question(t: "Approximately one quarter of human bones are in the feet.", a: "True"),
                       Question(t: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                       Question(t: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                       Question(t: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                       Question(t: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                       Question(t: "You can lead a cow down stairs but not up stairs.", a: "False"),
                       Question(t: "Google was originally called 'Backrub'.", a: "True"),
                       Question(t: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                       Question(t: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                       Question(t: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                       Question(t: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questionBank[questionNumber].answer {
            score += 1
            return true
               }
        else {
            return false
        }
    }
    
    func getNextQuestion() -> String{
        return questionBank[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float (questionBank.count)
    }
    
    mutating func changeQuestion() {
        if questionNumber + 1 < questionBank.count {
            questionNumber += 1
        }
        else{
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
