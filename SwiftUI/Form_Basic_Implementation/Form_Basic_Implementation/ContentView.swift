//
//  ContentView.swift
//  Form_Basic_Implementation
//
//  Created by Geunhye Yu on 2023/01/09.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var name = ""
    @State private var nameComponents = PersonNameComponents()
    @State var checkAmount = ""
    @State var numberOfPeople = 1
    @State var tipPercentage = 20
    let tipPercentages = [0, 5, 10, 15, 20, 25, 30]

    //Calculating amount of money per person
    var totalPerPerson: String{
        //because of picker,
        let check = (checkAmount as NSString).doubleValue
        let peopleCount = Double(numberOfPeople + 1)
        let tipPercent = Double(tipPercentage)
        let grandTotal = check + (check * tipPercent / 100)
        let amountPerPerson = grandTotal/peopleCount

        
        return String(format: "%.2f", Double(amountPerPerson))
    }
    
    
    struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(5)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 10)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.clear)
        }
    }
    
    var body: some View {
        NavigationStack {
            
            List{
                Section{
                    TextField("Name", value: $nameComponents, format:.name(style: .long))
                }header: {
                    Text("Name")
                }
                
                Section{
                    TextField("Total money on the check", text: $checkAmount)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(checkAmount)) { newValue in
                            let filtered = newValue.filter { "0123456789.,".contains($0) }
                            if filtered != newValue {
                                self.checkAmount = filtered
                            }}
                }header: {
                    Text("Total Amount")
                }
                
                Section{
                    Picker("",selection: $numberOfPeople){
                        ForEach(1..<100){
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(WheelPickerStyle())
                }header: {
                    Text("number of people")
                }
                
                Section{
                    Picker("", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Tip Percent")
                }
                
                Section{
                   Text("\(totalPerPerson)").frame(maxWidth: .infinity, alignment: .center)
                }header: {
                    Text("Amount per Person")
                }
               
            
                HStack{
                    Spacer()
                    Button(action: {
                        checkAmount = ""
                        numberOfPeople = 1
                        tipPercentage = 20
                    }, label: {
                        Text("Clear")
                    }).buttonStyle(.borderedProminent)
                    Spacer()
                }
                
            }.textFieldStyle(MyTextFieldStyle())
        
            
            .navigationTitle("We Split what we eat")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
