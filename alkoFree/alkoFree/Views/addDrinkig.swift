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
                    Text("Ile czystego alkoholu było pite?")
                    TextField("Wpisz swoją wagę", text: $stringHeight)
                }
                VStack{
                    Button(action: {
                        // akcja wykonywana po kliknięciu przycisku
                        let user = UserInfo(gender: gender, weight: Double(weight), height: Double(height), age: Double(selectedAge), userName: "username")
                        let drink = Drink(name: "Example drink", alcoholConcentration: 5.0, volume: 200, otherParameters: [:])
                        let measurement = Measurement(user: user, drink: drink, measurementTime: Date(), result: 0, stomachState: "empty", startDate: dateStart, endDate: endDate)
                        do {
                                                try viewContext.save()
                                            } catch {
                                                print("Error saving measurement: \(error.localizedDescription)")
                                            }
                    }) {
                        Text("Przycisk")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.red)
                    .cornerRadius(8)
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
