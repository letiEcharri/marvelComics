//
//  MarvelDataSource.swift
//  marvelComics
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation

class MarvelDataSource: DataSource {
    
    enum MarvelDataSourceModule: String {
        case characters = "/characters"
        case comics = "/comics"
    }
    
    enum ApiParameters: String {
        case timestamp = "ts"
        case apikey
        case hash
        case series
        case limit
        case nameStartsWith
    }
    
    private var urlBase: String {
        "https://gateway.marvel.com/v1/public"
    }
    
    private var publicKey: String {
        ""
    }
    
    private var privateKey: String {
        ""
    }
    
    private func getQueryItems() -> [URLQueryItem] {
        
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = (timestamp + privateKey + publicKey).toMD5()
        
        return [
            URLQueryItem(name: ApiParameters.timestamp.rawValue, value: timestamp),
            URLQueryItem(name: ApiParameters.apikey.rawValue, value: publicKey),
            URLQueryItem(name: ApiParameters.hash.rawValue, value: hash)
        ]
    }
    
    func executeRequest(from path: String, identifier: Int?, parameters: [String: Any]?, success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock) {
        
        var urlBaseString = urlBase + path
        
        if let characterID = identifier {
            urlBaseString += "/\(String(characterID))"
        }
        
        guard var urlComponents = URLComponents(string: urlBaseString) else {
            return
        }
        var queryItems: [URLQueryItem] = [URLQueryItem]()
        
        if let parameters = parameters {
            let items = parameters.compactMap { (key, value) in
                URLQueryItem(name: key, value: value as? String)
            }
            queryItems = items
        }
        queryItems.append(contentsOf: getQueryItems())
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        config.timeoutIntervalForResource = 20.0
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, _, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    failure(error)
                } else if let jsonData = responseData {
                    success(jsonData as AnyObject)
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    failure(error)
                }
            }
        }
        
        task.resume()
        
    }
}
