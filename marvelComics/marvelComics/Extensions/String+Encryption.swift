//
//  String+Encryption.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation
import CryptoKit

extension String {
    func toMD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
