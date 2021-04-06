//
//  WeatherClient.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

class WeatherClient: APIClient {
    let session: URLSession
    
    //MARK: - Init methods
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }
    
    //added this init method for unit test purpose
    init(session: URLSession) {
        self.session = session
    }
    
    func getWeather(completion: @escaping (Result<Weather?, DataError>) -> Void) {
        //create weather end point
        let weather: WeatherRequest = WeatherRequest.weather

        fetch(with: weather.request , decode: { json -> Weather? in
            guard let result = json as? Weather else { return  nil }
            return result
        }, completion: completion)
    }
}
