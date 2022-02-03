//
//  APIMockService.swift
//  APIMockService
//
//  Created by Eman Elrefai on 03.02.22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Product], APIError>
    
    func fetchProducts(url: URL?, completion: @escaping (Result<[Product], APIError>) -> Void) {
        completion(result)
    }
    
    
    
    
}
