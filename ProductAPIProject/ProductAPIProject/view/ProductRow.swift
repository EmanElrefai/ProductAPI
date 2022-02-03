//
//  ProductRow.swift
//  ProductRow
//
//  Created by Eman Elrefai on 03.02.22.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    let imageSize: CGFloat = 180
    let productDescriptionPadding: CGFloat = 8
    let noPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            
            if product.image?.url != nil {
                AsyncImage(url: URL(string: product.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
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
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            
            VStack(alignment: .center) {
                
                Text("\(product.price.description)$")
                    .bold().foregroundColor(.cyan)
                Text(product.productDescription)
                    .multilineTextAlignment(.center).foregroundColor(.black)
                    .padding(.init(top: noPadding, leading: productDescriptionPadding, bottom: productDescriptionPadding, trailing: productDescriptionPadding))
            }
            .navigationBarTitleDisplayMode(.inline)
        }.border(Color.gray)
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
