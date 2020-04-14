//
//  NetworkService.swift
//  WeatherInCombine
//
//  Created by PRIYANS on 14/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

struct Constants {
    struct URLs {
        static func weather(for city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d5a61dc143509a6795b16213876ab279&units=metric"
        }
    }
}

import Foundation
import Combine

class NetworkService {

    func fetchWeather(for city: String)-> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weather(for: city)) else {fatalError("Invalid URL")}

        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map{$0.main}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

    }
}
