//
//  ViewController.swift
//  Challenge2(PJ4toPJ6)
//
//  Created by Geunhye Yu on 2023/03/22.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), style: .plain, target: self, action: #selector(promptAddItem))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareList))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    @objc func promptAddItem(){
        let ac = UIAlertController(title: "Shopping", message: "Add a item", preferredStyle: .alert)
        ac.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default){[weak self, weak ac] action in
            guard let item = ac?.textFields?[0].text else { return }
            self?.insert(item)
        }
        ac.addAction(addAction)
        present(ac, animated: true)
    }
    
    func insert(_ item:String){
        if !item.isEmpty{
            shoppingList.append(contentsOf: [item])
            
            let indexPath = IndexPath(row: shoppingList.count-1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        } else{
            showAlertMsg()
        }
        
        return
    }
    
    @objc func shareList(){
        let list = shoppingList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [] )
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func showAlertMsg(){
        var ac = UIAlertController(title: "Error", message: "It is a empty text", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }


}

