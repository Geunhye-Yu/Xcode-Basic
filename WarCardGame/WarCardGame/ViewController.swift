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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func DealButton(_ sender: Any) {
        
        //print("Deal Tapped")
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        LeftCardImageView.image = UIImage(named: "card\(leftNumber)")
        RightCardImageView.image = UIImage(named:"card\(rightNumber)")
    }
    
}

