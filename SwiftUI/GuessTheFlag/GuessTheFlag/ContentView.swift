//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Geunhye Yu on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var count = 0
    @State private var showingAlert = false
    
    func DeleteAction(){
        print("now deleting")
    }
    func AddNumAndAlert(){
        count += 1
        if count >= 5{
            showingAlert = true
            
        }
        
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack(spacing: 50){
                Text("Hello, world")
                Text("This is inside a hstack")
                
            }.background(Color(red: 0.1, green: 2.5, blue: 7.5))
                
            Spacer()
            VStack(alignment: .leading) {
                Text("Hello, world")
                Text("This is inside a vstack")
                LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .white, location: 0.15), Gradient.Stop(color: .blue, location: 0.95)]), startPoint: .top, endPoint: .bottom)
                RadialGradient(gradient: Gradient(colors: [.black, .red]), center: .center, startRadius: 10, endRadius: 200)
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                HStack{
                    Button("when count over 5, alert", action: AddNumAndAlert).buttonStyle(.bordered)
                        .alert("The count is \(count)", isPresented: $showingAlert){
                        Button("Set to 0", role: .cancel){count = 0}
                        Button("Keep going"){}
                        } message: {
                            Text("Plase read this")
                        }
                    Text(String(count))
                }
                Button("Button 2"){}.buttonStyle(.borderedProminent)
                Button("Button 3", role: .destructive){}.buttonStyle(.bordered).tint(.mint)
                Button(role: .destructive, action: DeleteAction, label: {Label("Delete", systemImage:"eraser")}).buttonStyle(.borderedProminent)
                
            }
            Spacer()
            ZStack(alignment:.bottom){
                Text("Hello, world").background(.red)
                Text("This is inside a zstack. I want to make several lines to find the alignment.").fixedSize(horizontal: false, vertical: true)
                Text("the third one")
            }
            .background(.blue)
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
