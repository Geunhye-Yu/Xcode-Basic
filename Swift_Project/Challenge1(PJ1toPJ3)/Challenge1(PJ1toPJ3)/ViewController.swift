//
//  ViewController.swift
//  Challenge1(PJ1toPJ3)
//
//  Created by Geunhye Yu on 2023/02/23.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        do{
            let items = try fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.contains("@"){
                    let filename = item.split(separator: "@")
                    let country = String(filename[0])
                    if countries.contains(country) == false{
                        countries.append(country)
                    }
                }
            }
        }catch{
            
        }
        print(countries)

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.5)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.imageView?.layer.borderWidth = 0.2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedCountry = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

