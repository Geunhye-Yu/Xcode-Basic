//
//  DetailViewController.swift
//  Project1
//
//  Created by Geunhye Yu on 2023/02/10.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedImageNum: Int?
    var totalPictureNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedImageNum{
            title = "Picture \(selectedImageNum+1) of \(totalPictureNum)"
        }
        
        
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
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
