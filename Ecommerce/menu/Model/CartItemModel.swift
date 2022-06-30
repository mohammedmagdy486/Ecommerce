//
//  CartItemModel.swift
//  Ecommerce
//
//  Created by AMN on 6/26/22.
//

import Foundation
struct CartItemModel {
    private(set) public var itemImage : String
    private(set) public var itemName : String
    private(set) public var itemPrice : Float
    private(set) public var itemColor : String
    private(set) public var itemSize : String
    private(set) public var itemPriceBeforeDiscount : Float
    private(set) public var itemDescription : String
    
    init(itemName: String, itemImage: String,itemPrice: Float,itemColor: String, itemSize: String,itemPriceBeforeDiscount: Float,itemDescription: String){
        self.itemName = itemName
        self.itemImage = itemImage
        self.itemPrice = itemPrice
        self.itemColor = itemColor
        self.itemSize = itemSize
        self.itemPriceBeforeDiscount = itemPriceBeforeDiscount
        self.itemDescription = itemDescription
    }
}
