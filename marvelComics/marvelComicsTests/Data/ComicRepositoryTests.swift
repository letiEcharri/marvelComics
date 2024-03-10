//
//  ComicRepositoryTests.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import XCTest
@testable import marvelComics

final class ComicRepositoryTests: XCTestCase {
    var dataSource: MarvelDataSourceMock!
    var sut: ComicRepository!
    
    override func setUp() {
        dataSource = MarvelDataSourceMock()
        sut = ComicRepository(dataSource: dataSource)
    }
    
    func testGetList() async {
        do {
            let comics = try await sut.getList()
            XCTAssertNotNil(comics)
            XCTAssertFalse(comics.isEmpty)
        } catch {
            XCTFail("Invalid expected result")
        }
    }
    
    func testGetListFailure() async {
        dataSource.error = NSError(domain: "",
                                   code: 0,
                                   userInfo: ["error": "Error with comics"])
        do {
            _ = try await sut.getList()
            XCTFail("Invalid expected result")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
