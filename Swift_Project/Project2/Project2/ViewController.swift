//
//  ViewController.swift
//  Project2
//
//  Created by Geunhye Yu on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var roundCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        //bar button to show the scores
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        
    }
    
    @objc func showScore(){
        let av = UIActivityViewController(activityItems: [score], applicationActivities: [])
        av.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        present(av, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil){

        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " / Score: \(score)"
 
        
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        roundCount += 1
        
        if roundCount <= 10{
            if sender.tag == correctAnswer {
                title = "Win"
                score += 1
            } else{
                title = "Wrong! That's the flag of \(countries[sender.tag])"
                score -= 1
            }
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler:askQuestion))
            present(ac, animated: true)
        }else{
            title = "End"
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Game Ended", style: .destructive))
            present(ac, animated: true)
        }

    }

}

