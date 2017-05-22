//
//  CurrentWeather.swift
//  rainySunny
//
//  Created by Ben on 2017/5/21.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _currentWeatherType: String!
    private var _date: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var currentWeatherType: String {
        if _currentWeatherType == nil {
            _currentWeatherType = ""
        }
        
        return _currentWeatherType
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormmater = DateFormatter()
        dateFormmater.dateStyle = .long
        dateFormmater.timeStyle = .none
        let currentDate = dateFormmater.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetail(complete: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEAHTER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
//            print(result.value)
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weatherType = dict["weather"] as? [Dictionary<String, Any>] {
                    
                    if let main = weatherType[0]["main"] as? String {
                        self._currentWeatherType = main.capitalized
                        print(self._currentWeatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    
                    if let temp = main["temp"] as? Double {
                        let kelvinToCelsiusPreDivision = temp - 273.15
                        let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                        self._currentTemp = kelvinToCelsius
                        print(self._currentTemp)
                    }
                }
                complete()
            }
        }
        
    }
    
}
