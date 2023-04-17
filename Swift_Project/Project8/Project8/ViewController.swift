//
//  ViewController.swift
//  Project8
//
//  Created by Geunhye Yu on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    var cluesLabel: UILabel!
    var answerLabel: UILabel!
    //a answer that a player is trying to make new
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    //the buttons a player already used(tapped before submitting a answer)
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    var score = 0 {
        didSet{
            scoreLabel.text = "Score : \(score)"
        }
    }
    var level = 1

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        //buttonsView.backgroundColor = .green
        view.addSubview(buttonsView)
        
        //Score Label
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        scoreLabel.textAlignment = .right
        view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        //how likely make larger than its essential; high priority-not to stretch
        //setContentcompressionPriority; make smaller than its essential
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        view.addSubview(cluesLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        //how likely make larger than its essential; high priority-not to stretch
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        answerLabel.font = UIFont.systemFont(ofSize: 24)
        answerLabel.text = "ANSWERS"
        answerLabel.numberOfLines = 0
        answerLabel.textAlignment = .right
        view.addSubview(answerLabel)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        let submit = UIButton(type:  .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        view.addSubview(clear)
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for col in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                //letterButton.setTitle("WWW", for: .normal)

                let frame = CGRect(x: width*col, y: height*row, width: width, height: height)
                letterButton.frame = frame
                
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
            }
        }
        

        
        //set all constraints at once(accept an array of constraints)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant:-100),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant:-100),
            answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
        //cluesLabel.backgroundColor = .red
        //answerLabel.backgroundColor = .blue
        
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadLevel()
    }
    
    @objc func letterTapped(_ sender: UIButton){
        guard let buttonTitle = sender.titleLabel?.text else {return}
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        sender.isHidden = true
    }
    
    @objc func submitTapped(_ sender: UIButton){
        
        guard let answerText = currentAnswer.text else {return}
        
        if let solutionPosition = solutions.firstIndex(of: answerText){
            activatedButtons.removeAll()
            
            var splitAnswers = answerLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            answerLabel.text = splitAnswers?.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            
            if score % 7 == 0 {
                let ac = UIAlertController(title: "Well done", message: "Are you ready for the next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's go", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        }

    }
    
    @objc func clearTapped(_ sender: UIButton){
        currentAnswer.text = ""
        
        for btn in activatedButtons{
            btn.isHidden = false
        }
        
        activatedButtons.removeAll()
        
    }
    
    func loadLevel(){
        
        //load clues, answers from file to parameters
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let levelContents = try? String(contentsOf: levelFileURL){
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                
                for(idx, line) in lines.enumerated(){
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(idx+1). \(clue)\n"
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
                
            }
        }
        
        //configure the buttons and labels
        //removes spaces, tabs, line breaks from the start and ned of a string
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answerLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterBits.shuffle()
        
        if letterBits.count == letterButtons.count{
            for i in 0..<letterButtons.count{
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    func levelUp(action: UIAlertAction){
        
        level = 2
        solutions.removeAll(keepingCapacity: true)
        loadLevel()
        
        for btn in letterButtons{
            btn.isHidden = false
        }
        
    }

}

