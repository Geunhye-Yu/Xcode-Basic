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

struct Card{
    let initialCard : [String] = ["apple","cherry","star"]
    
    func randomCard()->[String]{
        
        var slottedCard = [String]()
        var cardName : String
        for _ in 0...initialCard.count-1 {
            cardName = initialCard[Int.random(in: 0...initialCard.count-1)]
            slottedCard.append(cardName)
        }
        return slottedCard
    }
}

struct Score{
    
    func caculateScore(randCard:[String], credit:Int)->Int{
        var result : Int
        if randCard.dropFirst().allSatisfy({ $0 == randCard.first }){
            result = credit + 10
        }
        else{
            result = credit - 5
        }
        return result
        }

}

