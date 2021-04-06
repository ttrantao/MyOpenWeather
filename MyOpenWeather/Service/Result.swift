//
//  Result.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

//Custom error
enum DataError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

//create a generic Result
enum Result<T, DataError>  {
    case success(T)
    case failure(DataError)
}
