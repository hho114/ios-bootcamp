//
//  WeatherManager.swift
//  Clima
//
//  Created by Alex Ho on 9/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Constants.api)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(with: urlString)
        
    }
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees ) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString:String) {
        //1. Create a URL
        if let url = URL(string: urlString)
        {
            //2. create an Url Session
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                    if let weather = parseJSON(safeData) {
                        //                        let weatherVC = WeatherViewController()
                        //                        weatherVC.didUpdateWeather(weather: weather)
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            }
            
            //4.start the task
            task.resume()
        }
        
        
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            //            print(decodedData.name)
            //            print(decodedData.main.temp)
            //            print(decodedData.weather[0].description)
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            //            print(weather.conditionName)
            //            print(weather.temperatureString)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
    
}
