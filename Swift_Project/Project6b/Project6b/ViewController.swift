//
//  ViewController.swift
//  Project6b
//
//  Created by Geunhye Yu on 2023/03/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Learn Auto Layout Visual Format Language(VFL): a way of drawing the layout
        let label1 = UILabel()
        //for setting constraints by hands, set disable the feature
        //that is IOS generates Auto Layout constraints by defalut
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        let viewsDicionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        //for label in viewsDicionary.keys {
            //NSLayoutConstraint..: method that converts VFL into an array of constratins
         //   view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDicionary))
            // H : Horizontal layout
            // | : the edge of the view
            // [\(label1)]: put label here(needs brackets[,]
        //}
        
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]", options: [], metrics: nil, views: viewsDicionary))
        // -: measn "space"(10 by default)
        
        //label size fix as 88 points and bottom is more than 10 points
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(==88)]-[label2(==88)]-[label3(==88)]-[label4(==88)]-[label5(==88)]-(>=10)-|", metrics: nil, views: viewsDicionary))
        
        //To give specific size as hard-coding is not good
        let metrics = ["labelHeight": 88]
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight)]-[label2(labelHeight)]-[label3(labelHeight)]-[label4(labelHeight)]-[label5(labelHeight)]-(>=10)-|", metrics: metrics, views: viewsDicionary))
        
        //There are always priorities for constraints(1 to 1000, by default, all is 1000)
        //first label proiority is less than other(@999) : shrinking the size
        //then have other labels adopt the same height as the first label: (label1)
        //view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", metrics: metrics, views: viewsDicionary))
        
        var previous: UILabel?
        
        //use of anchor
        for label in [label1, label2, label3, label4, label5]{
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            
            //label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            //label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1 ,constant: 10).isActive = true
            
            
            if let previous = previous{
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else{
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }
    }


}

