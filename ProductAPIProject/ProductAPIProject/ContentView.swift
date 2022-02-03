//
//  ContentView.swift
//  ProductAPIProject
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productFetcher = ProductFetcher()
    var body: some View {
        
        if productFetcher.isLoading {
            LoadingView()
        }else if productFetcher.errorMessage != nil  {
            ErrorView(productFetcher: productFetcher)
        }else {
            ProductGridView(products: productFetcher.products)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
