//
//  ContentView.swift
//  WeSplit
//
//  Created by Tri Pham on 8/18/20.
//  Copyright © 2020 Tri Pham. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section {
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section {
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                    }
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}


/*
struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0..<students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter Your Name", text: $name)
            Text("Your Name is \(name)")
            
        }
    }
}



struct ContentView: View {
    @State var tapCount = 0
    var body: some View {
        Button("Tap Count:  \(tapCount)") {
            self.tapCount += 1
        }
        
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World")
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
        
    }
}

*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





