//
//  ViewController.swift
//  WarCardGame
//
//  Created by Eunsoo Kang on 2022/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeftCardImageView: UIImageView!
    
    @IBOutlet weak var RightCardImageView: UIImageView!
    
    @IBOutlet weak var LeftScoreLabel: UILabel!
    
    @IBOutlet weak var RightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func DealButton(_ sender: Any) {
        
        //Randomize some numbers
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        //Update the image views
        LeftCardImageView.image = UIImage(named: "card\(leftNumber)")
        RightCardImageView.image = UIImage(named:"card\(rightNumber)")
        
        //Compare the randome numbers
        if leftNumber > rightNumber{
            // Left side wins
            leftScore += 1
            LeftScoreLabel.text = String(leftScore)
        }
        else if leftNumber < rightNumber{
            // Right side wins
            rightScore += 1
            RightScoreLabel.text = String(rightScore)
        }
        else {
            //Tie
        }
            
    }
    
}

