//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Geunhye Yu on 2023/03/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Hello Button"){
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)
            Text("Padding")
                .padding()
                .background(.green)
                .padding()
                .background(.blue)
                .padding()
                .background(.yellow)
            Text("Blur").blur(radius: 0)
        }
        .padding()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
