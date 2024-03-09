//
//  ComicRepositoryContract.swift
//  marvelComics
//
//  Created by Leticia Echarri on 9/3/24.
//

import Foundation

protocol ComicRepositoryContract {
    func getList() async throws -> [Comic]
}
