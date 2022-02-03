//
//  APIServiceProtocol.swift
//  APIServiceProtocol
//
//  Created by Eman Elrefai on 03.02.22.
//

import Foundation


protocol APIServiceProtocol {
    func fetchProducts(url: URL?, completion: @escaping(Result<[Product], APIError>) -> Void)
}
