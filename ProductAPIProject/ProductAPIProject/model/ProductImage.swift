//
//  ProductImage.swift
//  ProductImage
//
//  Created by Eman Elrefai on 03.02.22.
//

import Foundation

/*
 "image": {
 "width": 150,
 "height": 331,
 "url": "https://i.picsum.photos/id/1010/150/301.jpg?hmac=jOdmvDoGwNveVpbng2Z-dVzDjqBu97vauW0MUVvYeK0"
 },
 */

struct ProductImage: Codable {
    let width: Int?
    let height: Int?
    let url: String?
    
}


