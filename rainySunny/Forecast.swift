//
//  Forecast.swift
//  rainySunny
//
//  Created by Ben on 2017/5/22.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import Foundation
import Alamofire


class Forecast {
    private var _highTemp: String!
    private var _lowTemp: String!
    private var _forecastWehterType: String!
    private var _date: String!
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        
        return _highTemp
    }

    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        
        return _lowTemp
    }

    var forecastWehterType: String {
        if _forecastWehterType == nil {
            _forecastWehterType = ""
        }
        
        return _forecastWehterType
    }

    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }

    init(weatherDict: Dictionary<String,Any>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String,Any> {
            
            if let min = temp["min"] as? Double {
                let kelvinToCelsiusPreDivision = min - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                self._lowTemp = "\(kelvinToCelsius)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCelsiusPreDivision = max - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                self._highTemp = "\(kelvinToCelsius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,Any>] {
            
            if let main = weather[0]["main"] as? String {
                self._forecastWehterType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertDay = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertDay.dayOfweek()
            
        }
        
    }
}

extension Date {
    func dayOfweek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}







