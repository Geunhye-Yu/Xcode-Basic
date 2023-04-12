//
//  ViewController.swift
//  Project7
//
//  Created by Geunhye Yu on 2023/03/28.
//

import UIKit

class ViewController: UITableViewController {

    var allPetitions = [Petition]()
    var petitions = [Petition]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showInfo))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.fill"), style: .plain, target: self, action: #selector(promptSearchText))
        
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0{
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
                //method would exit if parsing was reached
            }
        }
        
        showError()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetition = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetition.results
            allPetitions = petitions
            tableView.reloadData()
        }
    }
    
    func showError(){
        let ac = UIAlertController(title: "Error", message: "Loading error", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func showInfo(){
        let ac = UIAlertController(title: "Info", message: "The data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func promptSearchText(){
        
        //var keyword = "President Trump"
        
        let ac = UIAlertController(title: "Find", message: "Put the text you want to find", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default){[weak self, weak ac] action in
            guard let keyword = ac?.textFields?[0].text else{ return }
            self?.filterText(keyword: keyword, filterStatus: true)
        }
        ac.addAction(submitAction)
        
        let backToAllAction = UIAlertAction(title: "Back to All", style: .cancel){[weak self] action in
            self?.filterText(keyword: "", filterStatus: false)
        }
        ac.addAction(backToAllAction)
        
        present(ac, animated: true)
        
    }
     
    func filterText(keyword: String, filterStatus: Bool){
        
        var filteredPetitions = [Petition]()
        
        if filterStatus{
            for (_, item) in allPetitions.enumerated(){
                if item.title.contains(keyword){
                    filteredPetitions.append(item)
                }
            }
            petitions = filteredPetitions

            
        } else {
            petitions = allPetitions

        }

        tableView.reloadData()
        
    }

}

