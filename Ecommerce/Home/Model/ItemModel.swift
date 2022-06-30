//
//  ItemModel.swift
//  Ecommerce
//
//  Created by AMN on 5/27/22.
//

import Foundation
struct ItemModel {
    private(set) public var itemImage : String
    private(set) public var itemName : String
    private(set) public var itemPrice : Float
    private(set) public var itemDescription: String

    init(itemName: String, itemImage: String,itemPrice: Float, itemDescription: String){
        self.itemName = itemName
        self.itemImage = itemImage
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
    }
}
