//
//  ContentView.swift
//  SwiftUI_Form
//
//  Created by Geunhye Yu on 2023/01/06.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var password: String = ""
    
    var body: some View {

        Form{
            // This is because SwiftUI does not allow to use 11 or more same rows.
            // Using Group is a way to work 11 or more rows(doesn't change any UI)
            Group{
                Text("I'm in a Group")
                Text("I'm in a Group")
                Text("I'm in a Group")
            }
            
            //Group does not affect any changes to UI
            //Section can make some section between bundles(splits into discrete groups)
            Section{
                Text("I'm in a Section")
            }
            
            //get some info from a user
            HStack{
                Text("e-mail").frame(width: 100)
                TextField("email", text:$name, prompt: Text("Required"))
                
            }
            HStack{
                Text("Password").frame(width: 100)
                SecureField(text: $password, prompt: Text("Required")){
                    Text("Password")
                }
            }
            
            Text("your e-mail is \(name)")
            
            
        }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
