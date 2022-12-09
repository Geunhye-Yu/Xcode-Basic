//
//  ContentView.swift
//  WarCardGame_Swift
//
//  Created by Eunsoo Kang on 2022/12/08.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card14"
    @State var cpuCard = "card14"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("Background").ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
        
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    //update card images
                    let playerRandomNum = Int.random(in: 2...14)
                    let cpuRandomNum = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(playerRandomNum)
                    cpuCard = "card\(cpuRandomNum)"
                    
                    //update scores
                    if playerRandomNum > cpuRandomNum{
                        playerScore += 1
                    }
                    else if playerRandomNum < cpuRandomNum{
                        cpuScore += 1
                    }
                    else{
                        
                    }
                }, label:
                        {
                    Image("dealbutton")
                })
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").font(.headline).foregroundColor(Color.white)
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("Player").font(.headline).foregroundColor(Color.white)
                        Text(String(cpuScore)).font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                    
                }
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
