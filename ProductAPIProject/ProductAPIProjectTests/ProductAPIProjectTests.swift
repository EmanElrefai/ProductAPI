//
//  ProductAPIProjectTests.swift
//  ProductAPIProjectTests
//
//  Created by Eman Elrefai on 03.02.22.
//

import XCTest
import Combine
@testable import ProductAPIProject


class ProductAPIProjectTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_products_success() {
        let result = Result<[Product], APIError>.success([Product.example1()])
        
        let fetcher = ProductFetcher(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting products")
        
        fetcher.$products.sink { products in
            if products.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
        
        let result = Result<[Product], APIError>.failure(APIError.badURL)
        let fetcher = ProductFetcher(service: APIMockService(result: result))
        
        let promise = expectation(description: "show error message")
        fetcher.$products.sink { products in
            if !products.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
    
}
