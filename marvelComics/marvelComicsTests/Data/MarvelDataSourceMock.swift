//
//  MarvelDataSourceMock.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation
@testable import marvelComics

class MarvelDataSourceMock: DataSource {
    var error: Error?
    
    func executeRequest(from path: String, identifier: Int?, parameters: [String : Any]?, success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock) {
        if let error = error {
            failure(error)
            return
        }
        switch path {
        case MarvelDataSource.MarvelDataSourceModule.comics.rawValue:
            getComics(success: success, failure: failure)
        default:
            break
        }
    }
}

extension MarvelDataSourceMock: LocalJsonService {
    func getComics(success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock) {
        readJson(.comics) { result in
            switch result {
            case .success(let result):
                do {
                    let data = try JSONSerialization.data(withJSONObject: result, options: [])
                    success(data as AnyObject)
                 } catch {
                     failure(error)
                 }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
