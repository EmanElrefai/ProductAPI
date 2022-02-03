//
//  ProductDetailView.swift
//  ProductDetailView
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    let imageSize: CGFloat = 500
    let productDescriptionPadding: CGFloat = 100
    let noPadding: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                if product.image?.url != nil {
                    AsyncImage(url: URL(string: product.image!.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame(width:imageSize, height:imageSize)
                                .clipped()
                            
                        } else if phase.error != nil {
                            
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                        
                    }
                }else {
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .center, spacing: 16) {
                    
                    Text("\(product.price.description)$")
                        .bold().foregroundColor(.cyan)
                    Text(product.productDescription)
                        .multilineTextAlignment(.center).foregroundColor(.black)
                        .padding(.init(top: noPadding, leading: productDescriptionPadding, bottom: noPadding, trailing: productDescriptionPadding))
                    
                }.navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.example1())
    }
}
