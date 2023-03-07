//
//  DetailViewController.swift
//  Challenge1(PJ1toPJ3)
//
//  Created by Geunhye Yu on 2023/03/07.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var countryImage: UIImageView!
    
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountry
        navigationItem.largeTitleDisplayMode = .never
        
        countryImage.layer.borderColor = UIColor.black.cgColor
        countryImage.layer.borderWidth = 0.3
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedCountry{
            countryImage.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }
    
    @objc func shareImage(){
        guard let img = countryImage.image?.jpegData(compressionQuality: 0.8) else{
            print("Image not existed")
            return
        }
        let avc = UIActivityViewController(activityItems: [img], applicationActivities: [])
        avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(avc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
