//
//  ProductFetcher.swift
//  ProductFetcher
//
//  Created by Eman Elrefai on 03.02.22.
//

import Foundation


class ProductFetcher: ObservableObject {
    
    @Published var products = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllProducts()
    }
    
    func fetchAllProducts() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://myjson.dit.upm.es/api/bins/fd6r")
        service.fetchProducts(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let products):
                    print("--- sucess with \(products.count)")
                    self.products = products
                }
            }
        }
        
    }
    
    //MARK: preview helpers
    
    static func errorState() -> ProductFetcher {
        let fetcher = ProductFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> ProductFetcher {
        let fetcher = ProductFetcher()
        fetcher.products = [Product.example1(), Product.example2()]
        
        return fetcher
    }
}
