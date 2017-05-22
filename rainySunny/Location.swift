//
//  Location.swift
//  rainySunny
//
//  Created by Ben on 2017/5/22.
//  Copyright © 2017年 Boyce. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() { }
    
    var longitude: Double!
    var latitude: Double!
}
