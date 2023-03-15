//
//  ViewController.swift
//  Project5
//
//  Created by Geunhye Yu on 2023/03/14.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //try? means code throws a error, send back nil(for safety of unwrapping)
            if let startWords = try? String(contentsOf: startWordURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["sillkworm"]
        }
        
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))

        startGame()
    }
    
    func startGame(){
        
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){[weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac,animated: true)
    }
    
    func submit(_ answer:String){
        var lowerAnswer = answer.lowercased()
        
        var errorTitle: String
        var errorMessage: String
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0)
                    
                    //add and show the answer at the tableview
                    //this is because calling reloadData() follows a lot of work
                    //the latest answer should be located on the top
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    return
                } else{
                    errorTitle = "Word not recognised"
                    errorMessage = "The word is not a real one"
                }
            } else{
                errorTitle = "Word used already"
                errorMessage = "Please use the one you never used"
            }
        } else{
            guard let title = title?.lowercased() else {return}
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)"
        }
        
        var ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let index = tempWord.firstIndex(of: letter){
                tempWord.remove(at: index)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        //utf16 identifies character more precisely
        let range = NSRange(location: 0, length: word.utf16.count)
        
        //rangeOfMisspelledWord returns NSRange structure
        //where the missspelling was found
        let missspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        //location tell where missspelling started but here only needs the spelling is correct
        return missspelledRange.location == NSNotFound
    }

}

