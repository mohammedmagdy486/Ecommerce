//
//  CategoryCVModel.swift
//  Ecommerce
//
//  Created by AMN on 5/26/22.
//

import Foundation
struct CategoryModel {
    private(set) public var categoryImage : String
    private(set) public var categoryName : String
    
    init(categoryName: String, categoryImage: String){
        self.categoryName = categoryName
        self.categoryImage = categoryImage
    }
}
