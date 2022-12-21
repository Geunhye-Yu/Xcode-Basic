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
        var scoreView = score.initialScore
        
        ZStack{
            VStack{
                    Spacer()
                    Text("SwiftUI Slots").font(.largeTitle)
                    Spacer()
                    Text("Credits: .\(scoreView)")
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
                        scoreView = score.caculateScore(randCard:cardsImages)
                        print(scoreView)
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
