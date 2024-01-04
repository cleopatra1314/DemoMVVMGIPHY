//
//  GIPClient.swift
//  Demo_MVVM_GIPHY
//
//  Created by cleopatra on 2024/1/3.
//

import Foundation

enum NetworkError: Error {
    case decodeDataFail
    case clientError(Data)
    case serverError
    case unexpectedError
}

class GipClient {
    
    static let shared = GipClient()
    
    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    
    private init() {}
    
//    @MainActor
    func getGIPData(success: @escaping ([GIPItem]) -> Void, failure: @escaping (NetworkError) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.giphy.com"
        urlComponents.path = "/v1/gifs/trending"
//        urlComponents.query = "limit=20&rating=g"
        urlComponents.queryItems = [
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "rating", value: "g")
        ]
        let url = urlComponents.url
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let httpResponse = response as? HTTPURLResponse,
                      let data = data else { return }
                let statusCode = httpResponse.statusCode
                
                switch statusCode {
                case 200...299:
                    print("")
                    do {
                        let GipObject = try JSONDecoder().decode(GIPModel.self, from: data)
                        success(GipObject.data)
                    } catch {
                        print(error)
                        failure(error as! NetworkError)
                    }
                    
                case 400...499:
                    NetworkError.clientError(data)
                default:
                    NetworkError.unexpectedError
                }
                
            }
        }
        
    }
}
