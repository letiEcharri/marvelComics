//
//  ComicListViewModelTests.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import XCTest
@testable import marvelComics

final class ComicListViewModelTests: XCTestCase {
    var repository: ComicRepositoryMock!
    var getComicListGroupByCreatorUseCase: GetComicListGroupByCreatorUseCase!
    var sut: ComicListViewModel!
    
    override func setUp() {
        repository = ComicRepositoryMock()
        getComicListGroupByCreatorUseCase = GetComicListGroupByCreatorUseCase(repository: repository)
        let useCases = ComicListViewModel.UseCases(getGroupedList: getComicListGroupByCreatorUseCase)
        sut = ComicListViewModel(useCases: useCases)
    }
    
    func testGetComics() async {
        await sut.getComics()
        
        DispatchQueue.main.async {
            XCTAssertFalse(self.sut.sections.isEmpty)
        }
    }
    
    func testGetComicsFailure() async {
        repository.error = NSError(domain: "",
                                   code: 0,
                                   userInfo: ["error": "Error with comics"])
        await sut.getComics()
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.sut.sections.isEmpty)
        }
    }
}
