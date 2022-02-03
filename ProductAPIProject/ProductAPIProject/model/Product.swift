//
//  Product.swift
//  Product
//
//  Created by Eman Elrefai on 03.02.22.
//

import Foundation

struct Product: Codable, Identifiable {
    
    let id = UUID()
    let price : Int
    let productDescription : String
    let image: ProductImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case price
        case productDescription
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        price = try values.decode(Int.self, forKey: .price)
        productDescription = try values.decode(String.self, forKey: .productDescription)
        image = try values.decodeIfPresent(ProductImage.self, forKey: .image)
    }
    
    init(productDescription: String, image: ProductImage?,  price: Int){
        
        self.price = price
        self.productDescription = productDescription
        self.image = image
    }
    
    
    //    {
    //        "id": 1,
    //        "productDescription": "1 - Lorem ipsum oo czsqotentbrukdkgutopykxslppqdfyecqnyvgevorbvfizvlz zsbycwbeumtttk",
    //        "image": {
    //          "width": 150,
    //          "height": 331,
    //          "url": "https://i.picsum.photos/id/1010/150/301.jpg?hmac=jOdmvDoGwNveVpbng2Z-dVzDjqBu97vauW0MUVvYeK0"
    //        },
    //        "price": 754
    //      },
    
    static func example1() -> Product {
        return Product(
            productDescription: "1 - Lorem ipsum oo czsqotentbrukdkgutopykxslppqdfyecqnyvgevorbvfizvlz zsbycwbeumtttk" , image:ProductImage(width: 150, height: 331, url: "https://i.picsum.photos/id/1010/150/301.jpg?hmac=jOdmvDoGwNveVpbng2Z-dVzDjqBu97vauW0MUVvYeK0"), price: 754)
        
    }
    
    //    {
    //        "id": 2,
    //        "productDescription": "2 - Lorem ipsum boqxjhitlihdzpadydtazicjfqjoqg swjsdibmq",
    //        "image": {
    //          "width": 150,
    //          "height": 308,
    //          "url": "https://i.picsum.photos/id/62/150/308.jpg?hmac=v--t36mvaUNgPphIzLhhqYT3ShCWMZ51V358xiX8dO4"
    //        },
    //   "price": 935
    //      },
    
    static func example2() -> Product {
        return Product(
            productDescription: "2 - Lorem ipsum boqxjhitlihdzpadydtazicjfqjoqg swjsdibmq", image: ProductImage(width: 150, height: 308, url: "https://i.picsum.photos/id/62/150/308.jpg?hmac=v--t36mvaUNgPphIzLhhqYT3ShCWMZ51V358xiX8dO4"), price: 935)
    }
}


