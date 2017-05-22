//
//  Constants.swift
//  rainySunny
//
//  Created by Ben on 2017/5/21.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import Foundation

let BASE: String = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE: String = "lat="
let LONGITUDE: String = "&lon="
let APP_ID: String = "&appid="
let API_KEY: String = "1b337b358c899854e7b6086d01fdac90"



let CURRENT_WEAHTER_URL = "\(BASE)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=1b337b358c899854e7b6086d01fdac90"

typealias DownloadComplete = () -> ()

