//
//  DataSource.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

typealias SuccessCompletionBlock = (_ object: AnyObject) -> Void
typealias FailureCompletionBlock = (_ error: Error) -> Void

protocol DataSource {
    func executeRequest(from path: String, identifier: Int?, parameters: [String: Any]?, success: @escaping (SuccessCompletionBlock), failure: @escaping FailureCompletionBlock)
}
