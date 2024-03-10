//
//  GetComicListGroupByCreatorUseCaseTests.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import XCTest
@testable import marvelComics

final class GetComicListGroupByCreatorUseCaseTests: XCTestCase {
    var repository: ComicRepositoryMock!
    var sut: GetComicListGroupByCreatorUseCase!
    
    override func setUp() {
        repository = ComicRepositoryMock()
        sut = GetComicListGroupByCreatorUseCase(repository: repository)
    }
    
    func testGetList() async {
        do {
            let comics = try await sut.execute()
            XCTAssertNotNil(comics)
            XCTAssertFalse(comics.isEmpty)
        } catch {
            XCTFail("Invalid expected result")
        }
    }
    
    func testGetListFailure() async {
        repository.error = NSError(domain: "",
                                   code: 0,
                                   userInfo: ["error": "Error with comics"])
        do {
            _ = try await sut.execute()
            XCTFail("Invalid expected result")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
