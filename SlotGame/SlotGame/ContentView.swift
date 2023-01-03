//
//  ContentView.swift
//  SlotGame
//
//  Created by Eunsoo Kang on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var cards = Card()
    @State var score = Score()
    @State var credit = 1000
    @State var slottedCard : [String] = ["apple","cherry","star"]
    
    var body: some View {

        VStack{
                Spacer()
                Text("SwiftUI Slots").font(.largeTitle)
                Spacer()
            Text("Credits: \(credit)")
                
                Spacer()
                HStack{
                    Spacer()
                    Image(slottedCard[0]).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(slottedCard[1]).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(slottedCard[2]).resizable().aspectRatio(contentMode: .fit)
                    Spacer()

                }
                Spacer()
                Button("Spin") {
                    slottedCard = cards.randomCard()
                    print(slottedCard)
                    credit = score.caculateScore(randCard:slottedCard, credit:credit)
                    print(credit)
                }
                Spacer()
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
