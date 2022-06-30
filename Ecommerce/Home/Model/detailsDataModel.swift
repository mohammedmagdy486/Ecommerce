//
//  detailsDataModel.swift
//  Ecommerce
//
//  Created by AMN on 6/13/22.
//

import Foundation
struct detailsDataModel {
    private(set) public var detailsImage : String
    private(set) public var itemIndex : Int
    init(detailsImage: String, itemIndex: Int){
        self.detailsImage = detailsImage
        self.itemIndex = itemIndex
    }
}
