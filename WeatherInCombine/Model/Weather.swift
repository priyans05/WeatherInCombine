//
//  Weather.swift
//  WeatherInCombine
//
//  Created by PRIYANS on 14/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {

    let temp: Double?
    let humidity: Double?

    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
    
}
