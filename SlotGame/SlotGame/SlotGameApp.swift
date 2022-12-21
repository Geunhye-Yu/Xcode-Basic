//
//  SlotGameApp.swift
//  SlotGame
//
//  Created by Eunsoo Kang on 2022/12/12.
//

import SwiftUI

@main
struct SlotGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Card{
    
    let numOfCard : Int = 3
    var card : [String]
    var slottedCard : [String]
    var cardName : String
    
    init() {
        self.card = ["apple", "cherry", "star"]
        self.slottedCard = [String]()
        self.cardName = ""
    }
    
    func randomCard()->[String]{
        slottedCard = [String]()
        for _ in 0...numOfCard-1 {
            cardName = card[Int.random(in: 0...numOfCard-1)]
            slottedCard.append(cardName)
        }
        return slottedCard
    }
}

class Score{
    var currentScore:Int = 1000
    func caculateScore(randCard:[String]){
        if randCard.dropFirst().allSatisfy({ $0 == randCard.first }){
            currentScore += 10
        }
        else{
            currentScore -= 5
        }
        }
    
}

