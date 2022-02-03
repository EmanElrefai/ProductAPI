//
//  ProductGridView.swift
//  ProductGridView
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct ProductGridView: View {
    let products: [Product]
    
    var body: some View {
        
        let noPadding: CGFloat = 0;
        let animationDuration: CGFloat = 0.5;
        
        let columns = [
            GridItem(.flexible(),spacing: noPadding,alignment: .top),
            GridItem(.flexible(),spacing: noPadding ,alignment: .top)
        ]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns,spacing: noPadding) {
                    
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetailView(product: product).animation(.easeInOut(duration: animationDuration))
                        }label: {
                            ProductRow(product: product)
                        }                       }
                }
                
            }.navigationTitle("Product list")
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView(products: ProductFetcher.successState().products)
    }
}
