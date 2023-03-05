//
//  dataModelStruct.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import Foundation

//Struktura "User":

struct User{
    var gender : String
    var weight : Double
    var height : Double
    var age : Double
}
//Struktura "Drink":

struct Drink {
    var name: String
    var alcoholConcentration: Double
    var volume: Double
    var otherParameters: [String: Any] // słownik do przechowywania innych parametrów
}

// Struktura Measurement
struct Measurement {
    var user: User
    var drink: Drink
    var measurementTime: Date
    var result: Double
    var stomachState: String
}

//Struktura "Database":
struct Database{
    var user : [User]
    var drink : [Drink]
    var measurement : [Measurement]
}
