//
//  ContentView.swift
//  SwiftUI_Form
//
//  Created by Geunhye Yu on 2023/01/06.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var income: Double = 0.0
    let studentList = ["Harry", "Sally", "John"]
    @State var selectedStudent = "Sally"
    @State var selectedBirthday = Date.now
    
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
                TextField("email", text:$email, prompt: Text("Required"))
                
            }
            HStack{
                Text("Password").frame(width: 100)
                SecureField(text: $password, prompt: Text("Required")){
                    Text("Password")
                }
            }
            
            HStack{
                Text("Income").frame(width: 100)
                TextField("Income", value: $income, format:.currency(code: Locale.current.currency?.identifier ?? "USD"), prompt: Text("2000.30")).keyboardType(.decimalPad)
            }
            //Picker of a list from the student list
            Picker("Select your student",selection: $selectedStudent){
                ForEach(studentList, id:\.self){
                    Text($0)
                }
            }
            //Datepicker to select birthday
            DatePicker("Birthday", selection: $selectedBirthday, in:...Date.now, displayedComponents: .date)
            Text("Birth day is \(selectedBirthday.formatted(date: .abbreviated, time: .shortened))")
        }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
