//
//  EndPoint.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var query: String {get }
}
extension Endpoint {
    
    //Create Url Components
    var urlComponents: URLComponents {
        var components = URLComponents(string: Constants.baseURL)!
        components.path = path
        components.query = query
        return components
    }
    
    //Create request
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

//Create our endpoint << enum created to add more requests later
enum WeatherRequest {
    case weather
}

extension WeatherRequest: Endpoint {

    //define path for specific endpoint
    var path: String {
        switch self {
        case .weather: return Constants.oneCallPath
        }
    }

    //define query for specific endpoint
    var query: String {
        switch self {
        case .weather: return Constants.oneCallQuery
        }
    }
}
