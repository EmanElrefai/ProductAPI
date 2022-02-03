//
//  ErrorView.swift
//  ErrorView
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var productFetcher: ProductFetcher
    var body: some View {
        VStack {
            
            Text("‼️")
                .font(.system(size: 80))
            
            Text(productFetcher.errorMessage ?? "")
            
            Button {
                productFetcher.fetchAllProducts()
            } label: {
                Text("Try again")
            }
            
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(productFetcher: ProductFetcher())
    }
}
