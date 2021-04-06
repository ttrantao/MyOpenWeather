//
//  APIClient.swift
//  MyOpenWeather
//
//  Created by Tran on 3/11/21.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, DataError>) -> Void)
}

extension APIClient {
    typealias JSONTaskCompletionHandler = (Decodable?, DataError?) -> Void
    
    //generic decoder
    private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
       
        let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, .failedRequest)
                    print("Error when fetching data : \(error)")
                }
                else if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 { //success if parsing ok
                        do {
                            let genericModel = try JSONDecoder().decode(decodingType, from: data)
                             completion(genericModel, nil)
                        }
                        catch {
                            completion(nil, .invalidResponse) //error while parsing
                            print("Error when parsing response : \(error)")
                        }
                    }
                    else {
                        completion(nil, .failedRequest)
                        print("Error when fetching data : response status code != 200")
                    }
                }
                else {
                    completion(nil, .unknown)
                }
        }
        return task
    }
    
    //Generic fetcher
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, DataError>) -> Void) {
            let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
                
                //MARK: change to main queue
                DispatchQueue.main.async {

                    guard let json = json else {
                        if let error = error {
                            completion(Result.failure(error))
                        } else {
                            completion(Result.failure(.unknown))
                        }
                        return
                    }
                    if let value = decode(json) {
                        completion(.success(value))
                    } else {
                        completion(.failure(.invalidResponse))
                    }
                }
            }
            task.resume()
    }
}
