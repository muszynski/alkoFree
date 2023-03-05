//
//  calculations.swift
//  alkoFree
//
//  Created by Łukasz Muszyński on 05/03/2023.
//

import Foundation

class AlcoholRate{

    func countTime(startDate: Date, endDate: Date) -> Int?{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: startDate, to: endDate)
        
        let hours = components.hour ?? 0
        return hours
        
    }
    
    func calculateBloodAlcoholContent(alcohol: Double, weight: Double, timeElapsed: Double, gender: String, height: Double, age: Double) -> Double {
        // zdefiniowanie parametrów dka kobiet i mężczyzn
        let alcoholDensity = 0.806
        let alcoholWaterRatio = 1.2
//        let bodyWaterRatioMale = 0.58
//        let bodyWaterRatioFemale = 0.49
//        let metabolicRate = 0.017
        // Obliczenie współczynnika korekcyjnego r
        var correctionFactor: Double
        if gender == "male" {
            correctionFactor = 2.447 - (0.09516 * age) + (0.1074 * height) / (0.3362 * weight)
        } else {
            correctionFactor = -2.097 + (0.1069 * height) - (0.0726 * age) / (0.2466 * weight)
        }
        // Obliczenie poziomu alkoholu we krwi
        let bloodAlcoholContent = (alcoholDensity * alcohol * alcoholWaterRatio) / (0.58 * weight * correctionFactor) - (0.017 * timeElapsed)
        
        return bloodAlcoholContent
    }
}




