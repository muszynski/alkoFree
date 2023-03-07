//
//  addDrinkig.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import SwiftUI

struct addDrinkig: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var gender = "male"
    @State private var selectedAge = 18
    @State private var weight = 90
    @State private var stringWeight = "90"
    @State private var height = 187
    @State private var stringHeight = "187"
    @State private var dateStart = Date.now
    @State private var endDate = Date.now
    @State private var alcoholMl = 123
    @State private var stringAlcoholMl = ""
    let ageRange = Array(18...100)
    
    var body: some View {
        VStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

            }
            .padding()
            Form {
                
                    HStack {
                        Toggle(isOn: Binding(
                            get: { self.gender == "male" },
                            set: { self.gender = $0 ? "male" : "female" }
                        )
                        ) {
                            Text("Male")
                        }
                        Toggle(isOn: Binding(
                            get: { self.gender == "female" },
                            set: { self.gender = $0 ? "female" : "male" }
                        )
                        ) {
                            Text("Female")
                        }
                    }
                    HStack{
                        DatePicker(selection: $dateStart, label: { Text("Start") })
                    }
                    HStack{
                        DatePicker(selection: $endDate, label: {
                            Text("Stop") })
                    }
                    VStack{
                        Picker("Wiek", selection: $selectedAge) {
                            ForEach(ageRange, id: \.self){
                                Text("\($0)").tag($0)
                            }
                        }.pickerStyle(MenuPickerStyle())
                    }
                HStack{
                    VStack{
                        Text("Waga")
                            
                        TextField("Wpisz swoją wagę", text: $stringWeight)
                            .keyboardType(.numberPad)
         
                    }
                    VStack{
                        Text("Wzrost")
                        TextField("Wpisz swoją wagę", text: $stringHeight)
                    }
         
                    
                }
                HStack{
                    Text("Ile pite?")
                    TextField("Wpisz ml", text: $stringAlcoholMl)
                    }
                }
                
            }
        }
    }


struct addDrinkig_Previews: PreviewProvider {
    static var previews: some View {
        addDrinkig()
    }
}
