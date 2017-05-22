//
//  WeatherCell.swift
//  rainySunny
//
//  Created by Ben on 2017/5/22.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    

    func configureCell(forecast: Forecast) {
        dayLbl.text = forecast.date
        typeLbl.text = forecast.forecastWehterType
        highTempLbl.text = forecast.highTemp
        lowTempLbl.text = forecast.lowTemp
        weatherIcon.image = UIImage(named: forecast.forecastWehterType)
        
    }


}
