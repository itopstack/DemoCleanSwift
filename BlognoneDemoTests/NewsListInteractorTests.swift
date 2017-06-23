//
//  NewsListInteractorTests.swift
//  BlognoneDemo
//
//  Created by Suraphan 'Rawd' Laokondee on 6/23/2560 BE.
//  Copyright (c) 2560 Suraphan 'Rawd' Laokondee. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import BlognoneDemo
import XCTest

class NewsListInteractorTests: XCTestCase {
  // MARK: - Subject under test
  
  var sut: NewsListInteractor!
  
  // MARK: - Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupNewsListInteractor()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupNewsListInteractor() {
    sut = NewsListInteractor()
  }
  
  // MARK: - Test doubles 
  
  // 1 demo NewsListInteractorOutputSpy
  class NewsListInteractorOutputSpy: NewsListInteractorOutput {
    // MARK: Method call expectations
    var presentRequestNewsFeedCalled = false
    
    // MARK: Spied methods
    func presentRequestNewsFeed(response: NewsList.RequestNewsFeed.Response) {
      presentRequestNewsFeedCalled = true
    }
  }


  // 2 demo NewsListWorkerSpy

  class NewsListWorkerSpy: NewsListWorker {
    var fetchNewsFeedCalled = false
    override func fetchNewsFeed(completionHandler: ([News]) -> Void) {
      fetchNewsFeedCalled = true
      completionHandler([])
    }
  }
  
  // MARK: - Tests
  
  func testFetchNewsFeedShouldAskNewSListWorkerToFetchNewsFeedAndPresenterToFormatResult() {
    // 3 demo test Interactor
    // Given
    let newsListInteractorOutputSpy = NewsListInteractorOutputSpy()
    sut.output = newsListInteractorOutputSpy
    
    let newsListWorkerSpy = NewsListWorkerSpy()
    sut.worker = newsListWorkerSpy
    
    // When
    let request = NewsList.RequestNewsFeed.Request()
    sut.fetchNewsFeed(request: request)
    
    // Then
    XCTAssert(newsListWorkerSpy.fetchNewsFeedCalled, "FetchNewsFeed() should ask NewsListWorker to fecth NewsFeed")
    
    XCTAssert(newsListInteractorOutputSpy.presentRequestNewsFeedCalled, "FetchNewsFeed() should ask presenter to format result")
    
  }
}