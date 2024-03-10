//
//  ComicDetailViewModelTests.swift
//  marvelComicsTests
//
//  Created by Leticia Echarri on 10/3/24.
//

import XCTest
@testable import marvelComics

final class ComicDetailViewModelTests: XCTestCase {
    var sut: ComicDetailViewModel!
    
    override func setUp() {
        let comic = ComicDetailViewModel.DetailModel(title: "Ironman",
                                                     description: "Descripción",
                                                     creator: "John")
        sut = ComicDetailViewModel(comic: comic)
    }
    
    func testInitialization() {
        XCTAssertEqual(sut.comic.title, "Ironman")
    }
}
