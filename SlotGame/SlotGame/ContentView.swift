//
//  ContentView.swift
//  SlotGame
//
//  Created by Eunsoo Kang on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var cardsImages = Array(repeating: "star", count: 3)
        var score = Score()
        var card = Card()
        
        
        ZStack{
            VStack{
                    Spacer()
                    Text("SwiftUI Slots").font(.largeTitle)
                    Spacer()
                Text("Credits: \(score.currentScore)")
                    Spacer()
                    HStack{
                        Spacer()
                        Image(cardsImages[0]).resizable().aspectRatio(contentMode: .fit)
                        Spacer()
                        Image(cardsImages[1]).resizable().aspectRatio(contentMode: .fit)
                        Spacer()
                        Image(cardsImages[2]).resizable().aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                    Spacer()
                    Button("Spin", action: {
                        cardsImages = card.randomCard()
                        print(cardsImages)
                        score.caculateScore(randCard:cardsImages)
                        print(score.currentScore)
                    })
                    Spacer()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
