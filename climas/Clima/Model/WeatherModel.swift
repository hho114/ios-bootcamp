//
//  WeatherModel.swift
//  Clima
//
//  Created by Alex Ho on 9/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
    return String(format: "%.1f", temperature)
    }
    
    var conditionName:String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...711:
            return "smoke"
        case 721:
            return "sun.haze"
        case 731:
            return "sun.dust"
        case 741:
            return "cloud.fog"
        case 751...771:
            return "sun.dust"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        default:
            return "cloud.sun"
    }
    }
    
}

