//
//  LocalJsonService.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import Foundation

enum LocalJsonFile {
    case comics
    
    var raw: String {
        switch self {
        case .comics:
            return "comics"
        }
    }
}

protocol LocalJsonService: AnyObject {
    func readJson(_ file: LocalJsonFile, completion: @escaping (Result<[String: Any], Error>) -> Void)
}

extension LocalJsonService {
    func readJson(_ file: LocalJsonFile, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let bundlePath = Bundle(for: Self.self).path(
            forResource: file.raw,
            ofType: "json"
        ) else {
            let error = NSError(domain: "",
                                code: 0,
                                userInfo: ["error": "Error with json"])
            completion(.failure(error))
            return
        }
        do {
            guard let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8),
            let dictionary = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
                let error = NSError(domain: "",
                                    code: 0,
                                    userInfo: ["error": "Error parsing comics"])
                completion(.failure(error))
                return
            }
            completion(.success(dictionary))
        } catch {
            completion(.failure(error))
        }
    }
}
